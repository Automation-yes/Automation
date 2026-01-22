import commonPage from '../pageObject/commonPage';
import { events } from '../testdata/events';
import { ActionHelper } from '../util/actionHelpers/actionHelper';


const eventButton = "//button[@au-id='event-mini-card-view-all-btn']";
const searchBar = "//input[@id='searchField-0.045929722506004356']";
const openButton = "//button[contains(text(), 'Open')]";

export default new class IrReportingEvent extends ActionHelper {
    public async navigateToIrReportingPage() {
        console.log('[DEBUG] Starting navigation to IR Reporting page');
        
        // Wait for page to fully load after login
        await this.waitForTimeout(3000);
        
        // First, let's check what's actually on the page by taking a screenshot
        await this.takeScreenshot('after_login_before_navigation');
        
        // Check if we're already on the correct page
        try {
            const currentUrl = await this.getCurrentUrl();
            console.log(`[DEBUG] Current URL: ${currentUrl}`);
            
            // If we're already on events or IR reporting page, continue
            if (currentUrl.includes('events') || currentUrl.includes('ir-reporting') || currentUrl.includes('incident')) {
                console.log('[DEBUG] ✅ Already on IR Reporting related page');
                return;
            }
        } catch (error) {
            console.log(`[DEBUG] Could not get current URL: ${error.message}`);
        }
        
        // Enhanced locator strategy - try different approaches
        let navigationSuccessful = false;
        
        // Strategy 1: Look for any clickable elements containing event-related text
        const eventNavigationLocators = [
            "//a[contains(@href, 'event') or contains(@href, 'Event')]", // Links with event in href
            "//button[contains(@onclick, 'event') or contains(@onclick, 'Event')]", // Buttons with event onclick
            "//div[contains(@class, 'event') or contains(@class, 'Event')]//a", // Event container with link
            "//div[contains(@class, 'event') or contains(@class, 'Event')]//button", // Event container with button
            "//*[contains(text(), 'Event') or contains(text(), 'event')][contains(@class, 'clickable') or @role='button' or self::button or self::a]",
            "//nav//*[contains(text(), 'Event') or contains(text(), 'IR') or contains(text(), 'Incident')]",
            "//*[@data-*='event' or @data-*='Event']", // Data attributes
            "//button[@au-id='event-mini-card-view-all-btn']", // Original locator
        ];
        
        for (const locator of eventNavigationLocators) {
            try {
                console.log(`[DEBUG] Trying navigation locator: ${locator}`);
                await this.waitForTheElement(locator, 3000);
                await this.waitForClickable(locator);
                console.log(`[DEBUG] ✅ Successfully clicked: ${locator}`);
                navigationSuccessful = true;
                break;
            } catch (error) {
                console.log(`[DEBUG] Navigation locator failed: ${locator}`);
                continue;
            }
        }
        
        if (!navigationSuccessful) {
            console.log('[DEBUG] ⚠ Navigation buttons not found, checking if we can proceed with search');
            // Take another screenshot to see current state
            await this.takeScreenshot('navigation_failed_current_state');
        }
        
        // Wait a moment for page transition
        await this.waitForTimeout(2000);
        
        // Strategy 2: Enhanced search functionality
        const searchLocators = [
            "//input[@type='text' and (@placeholder*='search' or @placeholder*='Search' or @placeholder*='filter' or @placeholder*='Filter')]",
            "//input[contains(@class, 'search') or contains(@class, 'filter')]",
            "//input[@id*='search' or @id*='Search' or @id*='filter' or @id*='Filter']",
            "//div[contains(@class, 'search')]//input",
            "*//input[@type='search']",
            searchBar, // Original locator
        ];
        
        let searchSuccessful = false;
        for (const searchLocator of searchLocators) {
            try {
                console.log(`[DEBUG] Trying search locator: ${searchLocator}`);
                await this.waitForTheElement(searchLocator, 3000);
                await this.enterText(searchLocator, events.chethanaEvent);
                console.log(`[DEBUG] ✅ Search successful with: ${searchLocator}`);
                searchSuccessful = true;
                
                // Wait for search results
                await this.waitForTimeout(1000);
                break;
            } catch (error) {
                console.log(`[DEBUG] Search locator failed: ${searchLocator}`);
                continue;
            }
        }
        
        if (!searchSuccessful) {
            console.log('[DEBUG] ⚠ No search functionality found');
            await this.takeScreenshot('search_failed_current_state');
        }
        
        // Strategy 3: Enhanced open button detection
        const openButtonLocators = [
            "//button[contains(text(), 'Open') or contains(text(), 'OPEN') or contains(@title, 'Open')]",
            "//a[contains(text(), 'Open') or contains(text(), 'OPEN') or contains(@title, 'Open')]",
            "//*[@role='button'][contains(text(), 'Open') or contains(text(), 'View') or contains(text(), 'Select')]",
            "//button[contains(@class, 'open') or contains(@class, 'view') or contains(@class, 'select')]",
            "//*[contains(@onclick, 'open') or contains(@onclick, 'view') or contains(@onclick, 'select')]",
            openButton, // Original locator
        ];
        
        let openSuccessful = false;
        for (const openLocator of openButtonLocators) {
            try {
                console.log(`[DEBUG] Trying open button locator: ${openLocator}`);
                await this.waitForTheElement(openLocator, 3000);
                await this.waitForClickable(openLocator);
                console.log(`[DEBUG] ✅ Open button clicked successfully: ${openLocator}`);
                openSuccessful = true;
                break;
            } catch (error) {
                console.log(`[DEBUG] Open button locator failed: ${openLocator}`);
                continue;
            }
        }
        
        if (!openSuccessful) {
            console.log('[DEBUG] ⚠ No open button found');
            await this.takeScreenshot('open_button_failed_final_state');
        }
        
        // Final verification
        await this.waitForTimeout(2000);
        try {
            const finalUrl = await this.getCurrentUrl();
            console.log(`[DEBUG] Final URL after navigation: ${finalUrl}`);
            await this.takeScreenshot('final_navigation_state');
        } catch (error) {
            console.log(`[DEBUG] Could not get final URL: ${error.message}`);
        }
        
        console.log('[DEBUG] IR Reporting page navigation completed');
    }
};
