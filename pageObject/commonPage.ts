import { ActionHelper } from '../util/actionHelpers/actionHelper';
import logger from '../util/logger';
import { createRequest } from '../util/command';
import { userData } from '../testdata/login';
import { prodEndpoints, qcEndpoints, uatEndpoints } from '../testdata/urls';
import { request } from '@playwright/test';

const usernameField = "//input[@id='userName']";
const nextButton = "//button[@type='submit']"
const passwordField = "//input[@id='password']";
const signInButton = "//button[@class='btn btn-success full login__btn']";

export default new class CommonPage extends ActionHelper {

    public async navigateToLoginPage(url) {
         await this.launchBrowser(url);
    }

    public async logout() {
        
    }
    public async login(username, password) {
       await this.waitForElementVerification(usernameField);
         await this.enterText(usernameField, username);
         await this.waitForClickable(nextButton);
         await this.waitForElementVerification(passwordField);
         await this.enterText(passwordField, password);
         await this.waitForClickable(signInButton);
    }

    public async invlaidUserErrorMessage(){
       
    }

    public async verifyTheText() {
        
    }

    // Helper function for token refresh
    public async refreshTokenIfNeeded(response: any): Promise<string> {
        if (response.status() === 401) {
            console.log('Token expired, refreshing...');
            
            const loginUrl = process.env.PRODUCTION ? prodEndpoints.loginUrl : process.env.QA ? qcEndpoints.loginUrl : uatEndpoints.loginUrl;
            const password = process.env.PRODUCTION ? userData.prodPassword : process.env.QA ? userData.qaPassword : userData.stagingPassword;
            
            try {
                const loginResponse = await createRequest(loginUrl, { username: userData.username, password: password });
                const newBearerToken = `Bearer ${loginResponse.data.token}`;
                console.log('Token refreshed successfully');
                return newBearerToken;
            } catch (error) {
                console.error('Error refreshing token:', error);
                throw error;
            }
        }
        return '';
    }

    // API authentication setup
    public async apiAuthentication(): Promise<string> {
        try {
            console.log('🔧 Starting API authentication...');
            
            const loginUrl = process.env.PRODUCTION ? prodEndpoints.loginUrl : process.env.QA ? qcEndpoints.loginUrl : uatEndpoints.loginUrl;
            const password = process.env.PRODUCTION ? userData.prodPassword : process.env.QA ? userData.qaPassword : userData.stagingPassword;
            
            // Get authentication token
            const loginResponse = await createRequest(loginUrl, { username: userData.username, password: password });
            const bearerToken = `Bearer ${loginResponse.data.token}`;
            
            console.log('✅ Authentication token obtained successfully');
            return bearerToken;
            
        } catch (error) {
            console.error('❌ Error during API authentication:', error);
            throw error;
        }
    }

    // Setup API contexts with authentication and token refresh handling
    public async setupApiContexts(baseUrl: string): Promise<{
        contexts: any;
        contextsInvalidToken: any;
        contextsMissingToken: any;
        bearerToken: string;
    }> {
        try {
            console.log('🔧 Setting up API contexts...');
            
            // Get authentication token
            const bearerToken = await this.apiAuthentication();
            
            // Valid token context
            const contexts = await request.newContext({
                timeout: 60000,
                baseURL: baseUrl,
                extraHTTPHeaders: {
                    'Accept': 'application/json, text/plain, */*',
                    'content-type': 'application/json',
                    'Authorization': bearerToken,
                }
            });
            
            // Store original post method and wrap it with 401 handling
            const originalPost = contexts.post.bind(contexts);
            contexts.post = async (url: string, options?: any) => {
                const response = await originalPost(url, options);
                if (response.status() === 401) {
                    const newToken = await this.refreshTokenIfNeeded(response);
                    if (newToken) {
                        // Update the context with new token
                        const updatedContext = await request.newContext({
                            timeout: 60000,
                            baseURL: baseUrl,
                            extraHTTPHeaders: {
                                'Accept': 'application/json, text/plain, */*',
                                'content-type': 'application/json',
                                'Authorization': newToken,
                            }
                        });
                        // Replace the context methods
                        Object.assign(contexts, updatedContext);
                    }
                    return await originalPost(url, options);
                }
                return response;
            };
            
            // Invalid token context
            const contextsInvalidToken = await request.newContext({
                timeout: 60000,
                baseURL: baseUrl,
                extraHTTPHeaders: {
                    'Accept': 'application/json, text/plain, */*',
                    'content-type': 'application/json',
                    'Authorization': 'Bearer invalid_token_12345',
                }
            });
            
            // Missing token context
            const contextsMissingToken = await request.newContext({
                timeout: 60000,
                baseURL: baseUrl,
                extraHTTPHeaders: {
                    'Accept': 'application/json, text/plain, */*',
                    'content-type': 'application/json',
                }
            });
            
            console.log('✅ All API contexts initialized successfully');
            
            return {
                contexts,
                contextsInvalidToken,
                contextsMissingToken,
                bearerToken
            };
            
        } catch (error) {
            console.error('❌ Error setting up API contexts:', error);
            throw error;
        }
    }
};
