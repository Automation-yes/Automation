import { Before, After, BeforeAll, AfterAll, Status } from '@cucumber/cucumber';
import { pageFixture } from './pageFixture';
import { chromium, Page, Browser, firefox, BrowserContext, webkit } from '@playwright/test';
import { invokeBrowser } from '../hooks/browserManger';
import { setDefaultTimeout } from '@cucumber/cucumber';
import logger from '../../../util/logger';

const timeout = 600000;
setDefaultTimeout(timeout);
let browser: Browser;
let context: BrowserContext;

BeforeAll(async function () {
    browser = await invokeBrowser();
});

Before(async function () {
    context = await browser.newContext();
    const page = await context.newPage();
    pageFixture.page = page;
});

After(async function ({ pickle, result }) {
    logger.info(result?.status);
    if (result?.status == Status.FAILED) {
        const img = await pageFixture.page.screenshot({ path: `./test-result/screenshots/${pickle.name}.png`, type: 'png' });
        this.attach(img, 'image/png');
    }
    await pageFixture.page.close();
    await context.close();
});

AfterAll(async function () {
    await browser.close();
});
