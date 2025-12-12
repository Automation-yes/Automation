import { pageFixture } from '../../src/test/hooks/pageFixture';
import { Browser, chromium } from 'playwright';
import { expect } from '@playwright/test';
import logger from '../logger';
// const { chromium } = require('playwright');


export class ActionHelper {

    private browser: Browser;

    public async launchBrowser(url: any) {
        this.browser = await chromium.launch();
        logger.info(`Launching browser and navigating to ${url}`);
        await pageFixture.page.goto(url, { waitUntil: 'domcontentloaded' });
    }

    public async previousPage(){
        logger.info('Move back to previous page');
        await pageFixture.page.goBack();
    }

    public async disableField(locator){
        const DropdownDisabled = await pageFixture.page.locator(locator);
        if (DropdownDisabled) {
            //const isDropdownDisabled = await DropdownDisabled.getProperty('disabled').then(property => property === true);

            // Assert that the dropdown is disabled
           // expect(isDropdownDisabled).toBeTruthy();
          } else {
            // Handle the case when the element is not found
            throw new Error(`Dropdown element with selector '${DropdownDisabled}' not found.`);
          }
    }

    public async closeCurrentWindow() {
        const browser = await chromium.launch();
        const page = await browser.newPage();
        await browser.close();
      }

    public async enterText(locator: any, text: any) {
        logger.info(`Entering text in element with locator '${locator}'`);
        
        // Handle undefined or null text
        if (text === undefined || text === null) {
            logger.error(`Text is undefined or null for locator '${locator}'`);
            throw new Error(`Text parameter is undefined or null for locator '${locator}'`);
        }
        
        const textToEnter = text.toString();
        logger.info(`Text to enter: '${textToEnter}'`);
        
        const element = pageFixture.page.locator(locator);
        await element.waitFor({ state: 'visible' });
        await element.clear();
        await element.fill('');
        await element.fill(textToEnter);
    }

    public async waitForTheElement(locator:any) {
        logger.info(`Waiting for element with locator '${locator}' to be visible`);
        await pageFixture.page.locator(locator).waitFor({ state: 'visible' });
    }

    public async waitForClickable(locator: any) {
        logger.info(`Waiting for element with locator '${locator}' to be visible and clickable`);
        await pageFixture.page.locator(locator).waitFor({ state: 'visible' });
        await pageFixture.page.locator(locator).click();
    }

    public async waitForElementVerification(locator) {
        logger.info(`Waiting for element with locator '${locator}' to be visible for verification`);
        await pageFixture.page.locator(locator).waitFor({ state: 'visible' });
        await pageFixture.page.locator(locator);
    }

    public async elementNotPresent(locator){
        logger.info(`Element should not found '${locator}'`);
        const element = pageFixture.page.locator(locator);
        await element.isVisible() === false;
    }

    public async mouseOver(locator: string) {
        logger.info(`Performing mouseover on element with locator '${locator}'`);
        const element = pageFixture.page.locator(locator);
        await element.waitFor({ state: 'visible' });
        await element.hover();
    }

    public async hoverClick(locator: string) {
        logger.info(`Performing mouseover and click on element with locator '${locator}'`);
        const element = pageFixture.page.locator(locator);
        await element.waitFor({ state: 'visible' });
        await element.hover();
        await element.click();
    }

    public async sendEscCommand(text: any) {
        logger.info(`Sending Escape key command: ${text}`);
        await pageFixture.page.keyboard.press(text);
    }

    public async scrollToElement(locator) {
        logger.info(`Scrolling into view and clicking on element with locator '${locator}'`);
        const element = await pageFixture.page.locator(locator);
        await element.scrollIntoViewIfNeeded();
    }
    public async scrollClick(locator) {
        logger.info(`Scrolling into view and clicking on element with locator '${locator}'`);
        const element = await pageFixture.page.locator(locator);
        await element.scrollIntoViewIfNeeded();
        await element.click();
    }

    public async getVauleFromField(locator: any, text: any) {
        logger.info(`Getting value from field with locator '${locator}' and attribute '${text}'`);
        const element = await pageFixture.page.locator(locator);
        await element.getAttribute(text);
    }

    public async getDateTime() {
        logger.info('Getting current date and time');
        const now = new Date();
        const dateTimeFormatter = new Intl.DateTimeFormat('en-US', {
            month: 'long',
            day: 'numeric',
            hour: '2-digit',
            minute: '2-digit',
            hour12: true,
        });
        const formattedDateTime = dateTimeFormatter.format(now);
        return formattedDateTime;
    }

    public async extractDate(){
        const currentDate = new Date();
        const day = String(currentDate.getDate()).padStart(2, '0');
        return day;
    }

   public async setFutureDateTime(daysToAdd: number){
          const currentDate = new Date();
          const futureDate = new Date(currentDate.getTime() + daysToAdd * 24 * 60 * 60 * 1000);
          return futureDate;
      }

   public async setPastDateTime(daysToSubtract: number){
        const currentDate = new Date();
        currentDate.setDate(currentDate.getDate() - daysToSubtract);
        return currentDate;
   }

    public randomTextGenator() {
        logger.info('Generating random text');
        const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
        let result = '';
        for (let i = 0; i < 5; i++) {
            const randomIndex = Math.floor(Math.random() * characters.length);
            result += characters.charAt(randomIndex);
        }
        return result;
    }

    public async evaluatePerformanceForFunction() {
        logger.info('Evaluating performance for the function');
        const loadTime = await pageFixture.page.evaluate(() => performance.timing.loadEventEnd - performance.timing.navigationStart);
        console.log(`Page load time: ${loadTime} ms`);
        expect(loadTime).toBeLessThan(3000);
    }

    public async selectOptionFromDropDown(locator,optionValue ){
        logger.info(`Waiting for element with locator '${locator}' to be visible and clickable`);
        await pageFixture.page.locator(locator).waitFor({ state: 'visible' });
        await pageFixture.page.locator(locator).click();
        await pageFixture.page.selectOption(locator,{ value: optionValue });
    }

    public async getTextFromElement(locator){
        logger.info(`Getting text from element with locator '${locator}'`);
        const element = await pageFixture.page.locator(locator);
        const text = await element.innerText();
        return text;
    }

    public async textPresent(locator,text){
        logger.info(`Verifying text '${text}' is present in element with locator '${locator}'`);
        const element = await pageFixture.page.locator(locator);
        const elementText = await element.innerText();
        expect(elementText).toContain(text);
    }

    public async waitForTimeout(time){
        logger.info(`Waiting for ${time} milliseconds`);
        await pageFixture.page.waitForTimeout(time);
    }

    public async verifyElementNotPresent(locator){
        logger.info(`Verifying element with locator '${locator}' is not present`);
        const element = await pageFixture.page.locator(locator);
        expect(element).toBeFalsy();
    }

    public async verifyTextNotPresent(text){
        logger.info(`Verifying text '${text}' is not present on the page`);
        const pageContent = await pageFixture.page.content();
        expect(pageContent).not.toContain(text);
    }

    public async verifyTextPresent(text){
        logger.info(`Verifying text '${text}' is present on the page`);
        const pageContent = await pageFixture.page.content();
        expect(pageContent).toContain(text);
    }

    public async selectDropDownValue(locator, value){
        logger.info(`Selecting value '${value}' from dropdown with locator '${locator}'`);
        await pageFixture.page.selectOption(locator, { value: value });
    }

    public async generateRandomNumbers(total, count) {
        const numbers = [];
        let sum = 0;

        // Generate random numbers and store them
        for (let i = 0; i < count - 1; i++) {
            const randomValue = Math.random() * total;
            numbers.push(randomValue);
            sum += randomValue;
        }

        // Ensure the sum of the numbers equals the total by adjusting the last number
        const lastNumber = total - sum;
        numbers.push(lastNumber);

        // Return the generated numbers
        return numbers;
    }

    public async getTextIsPresent(locator, text){
        logger.info(`Verifying text '${text}' is present in element with locator '${locator}'`);
        const element = await pageFixture.page.locator(locator);
        const elementText = await element.innerText();
        expect(elementText).toContain(text);
    }

    public async isElementEnabled(locator){
        logger.info(`Verifying element with locator '${locator}' is enabled`);
        const element = await pageFixture.page.locator(locator);
        const isEnabled = await element.isEnabled();
        expect(isEnabled).toBeTruthy();
    }


public async switchTab(index: number) {

    const context = await pageFixture.page.context();

    const pages = await context.pages();
    if (pages && pages.length > index) {

        if (pages && pages.length > index) {

            await pages[index].bringToFront();

        } else {

            throw new Error(`No page found at index ${index}`);

        }

    } else {

        throw new Error('No context found at index');
    }
}
}


