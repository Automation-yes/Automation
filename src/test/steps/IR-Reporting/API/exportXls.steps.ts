import { Given, When, Then, BeforeAll } from '@cucumber/cucumber';
import { expect, request } from '@playwright/test';
import { fetchRequests, createRequest, updateRequest, removeRequest, loginRequest } from '../../../../../util/command';
import axios from 'axios';
import { userData } from '../../../../../testdata/login';
import { prodEndpoints, qcEndpoints, uatEndpoints } from '../../../../../testdata/urls';
import * as XLSX from 'xlsx';
import commonPage from '../../../../../pageObject/commonPage';

let response: any;
let apiRoute: string;
let validateResponse: any;
let exportResponse: any;
let accountId: number;
let eventId: number;
let postData: any;
let contexts: any;
let contextsInvalidToken: any;
let contextsMissingToken: any;
let bearerToken: string;

const baseUrl = process.env.PRODUCTION ? prodEndpoints.prodIrReportingUrl : process.env.QA ? qcEndpoints.qaIrReportingUrl : uatEndpoints.irReportingUrl;


BeforeAll(async function () {
  try {
    console.log('🔧 Setting up API contexts for export tests...');
    
    // Use common page method to setup all API contexts
    const apiSetup = await commonPage.setupApiContexts(baseUrl);
    
    contexts = apiSetup.contexts;
    contextsInvalidToken = apiSetup.contextsInvalidToken;
    contextsMissingToken = apiSetup.contextsMissingToken;
    bearerToken = apiSetup.bearerToken;
    
    console.log('✅ All API contexts initialized successfully');
    
  } catch (error) {
    console.error('❌ Error setting up API contexts:', error);
    throw error;
  }
});


Given(/^I have a valid accountId (.*) and eventId (.*)$/, async (accId: string, evtId: string) => {
  try {
    accountId = parseInt(accId);
    eventId = parseInt(evtId);
    apiRoute = `${baseUrl}/accounts/${accountId}/events/${eventId}/reports/audience/timelines/export?includeTotal=true`;
    
    console.log(`📋 Setup complete - AccountID: ${accountId}, EventID: ${eventId}`);
    console.log(`🔗 API Route: ${apiRoute}`);
  } catch (error) {
    console.error('❌ Error setting up test data:', error);
    throw error;
  }
});

When('I send a POST request to the exportDownloads endpoint', async () => {
  try {
    // Prepare POST data with column translator
    postData = {
      columnTranslator: [
        { label: 'Time', value: 'time' },
        { label: 'Visits', value: 'visits' },
      ],
    };
    
    console.log('📤 Sending POST request to export endpoint...');
    console.log('📋 POST Data:', JSON.stringify(postData, null, 2));
    
    // Use createRequest from command.ts for POST request
    response = await createRequest(apiRoute, postData, userData.token);
    
    console.log(`📡 Response Status: ${response.status}`);
    console.log(`📋 Response Headers:`, response.headers);
    
    // Verify response is a downloadable Excel file
    const contentDisposition = response.headers['content-disposition'];
    
    if (contentDisposition) {
      expect(contentDisposition).toContain('attachment');
      expect(contentDisposition).toContain('audience-visitorsovertime');
      console.log('✅ Content-Disposition header validation passed');
    }
    
    // Validate Excel content if status is 200
    if (response.status === 200 && response.data) {
      await validateExcelContent(response.data);
    }
    
    exportResponse = response;
    
  } catch (error) {
    console.error('❌ Error in POST request:', error);
    throw error;
  }
});

When('I send a GET request to fetch export data', async () => {
  try {
    console.log('📤 Sending GET request to export endpoint...');
    
    // Use fetchRequests from command.ts for GET request
    response = await fetchRequests(apiRoute, userData.token);
    
    console.log(`📡 Response Status: ${response.status}`);
    console.log(`📋 Response Data Type: ${typeof response.data}`);
    
    if (response.status === 200) {
      console.log('✅ GET request successful');
    }
    
  } catch (error) {
    console.error('❌ Error in GET request:', error);
    throw error;
  }
});

Then('the response status should be {int}', async (expectedStatus: number) => {
  try {
    expect(response.status).toBe(expectedStatus);
    console.log(`✅ Status validation passed - Expected: ${expectedStatus}, Actual: ${response.status}`);
  } catch (error) {
    console.error(`❌ Status validation failed - Expected: ${expectedStatus}, Actual: ${response.status}`);
    throw error;
  }
});

Then('the response should contain Excel file data', async () => {
  try {
    // Verify content type for Excel
    const contentType = response.headers['content-type'];
    if (contentType) {
      expect(contentType).toMatch(/application\/.*excel|application\/.*spreadsheet|application\/octet-stream/);
      console.log('✅ Content-Type validation passed for Excel file');
    }
    
    // Verify response has data
    expect(response.data).toBeDefined();
    expect(response.data.length || response.data.byteLength).toBeGreaterThan(0);
    
    console.log('✅ Excel file data validation passed');
  } catch (error) {
    console.error('❌ Excel file validation failed:', error);
    throw error;
  }
});

Then('the Excel file should contain the required columns', async () => {
  try {
    if (response.data) {
      await validateExcelContent(response.data);
      console.log('✅ Excel column validation completed');
    } else {
      throw new Error('No response data available for Excel validation');
    }
  } catch (error) {
    console.error('❌ Excel column validation failed:', error);
    throw error;
  }
});

Then('the response should have proper export headers', async () => {
  try {
    const headers = response.headers;
    
    // Check for content-disposition header
    expect(headers['content-disposition']).toBeDefined();
    expect(headers['content-disposition']).toContain('attachment');
    
    // Check for content-length if available
    if (headers['content-length']) {
      expect(parseInt(headers['content-length'])).toBeGreaterThan(0);
    }
    
    console.log('✅ Export headers validation passed');
  } catch (error) {
    console.error('❌ Export headers validation failed:', error);
    throw error;
  }
});

function validateExcelContent(data: any) {
    throw new Error('Function not implemented.');
}
