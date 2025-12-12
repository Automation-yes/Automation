import { Given, When, Then } from '@cucumber/cucumber';
import { userData } from '../../../../../testdata/login';
import loginPage from '../../../../../pageObject/loginPage';

Given(/^Login into application$/, async function () {
   
    await loginPage.login();
});

When(/^User opne the (\d+) and (\d+)$/, async function (accountId: string, eventId: string) {
    
});

When(/^navigate to IR Reporting page$/, async function () {
   
});

Then(/^Verify that user is on IR Reporting page$/, async function () {
   
});