import { Browser, chromium, firefox, LaunchOptions, webkit } from '@playwright/test';

const options: LaunchOptions = {
    headless: false,
};

export const  invokeBrowser = () => {
    const browserType = process.env.BROWSER?.toLowerCase();
    switch (browserType){
        case 'chrome':
        return chromium.launch(options);
        case 'firefox':
        return  firefox.launch(options);
        case 'webkit':
        return  webkit.launch(options);

        default:
        return chromium.launch(options);
    }
};

