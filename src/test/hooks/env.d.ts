export { };

declare global {
    namespace NodeJS {
        interface processENV {
            BROWSER: 'chrome' | 'firefox' | 'webkit',
        }
    }
}
