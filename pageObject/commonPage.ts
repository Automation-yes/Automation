import { ActionHelper } from '../util/actionHelpers/actionHelper';
import logger from '../util/logger';
import { createRequest } from '../util/command';
import { userData } from '../testdata/login';
import { prodEndpoints, qcEndpoints, uatEndpoints } from '../testdata/urls';
import { request } from '@playwright/test';
import SecurityQuestionsPage from './questions';

const usernameField = "//input[@id='userName']";
const nextButton = "//button[@type='submit']"
const passwordField = "//input[@id='password']";
const signInButton = "//button[@class='btn btn-success full login__btn']";
const deshboardHeader = "//h1[@class='mb-4 font-semibold text-xl dark:text-white-100 dark:bg-gray-900']";
const securityCodeField = "//div[@id='qnAFormPanel']";
const continueButton = '//span[@class="SQcontinueButtonText"]';

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
         await this.enterText(passwordField, password);
         await this.waitForClickable(signInButton);
          await SecurityQuestionsPage.handleSecurityQuestions();
          await this.waitForClickable(continueButton);
    }

    public async invlaidUserErrorMessage(){
       
    }

    public async verifyTheText() {
        
    }
};
