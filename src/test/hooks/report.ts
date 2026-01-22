import * as fs from 'fs';
import * as path from 'path';
import { randomUUID } from 'crypto';

// Convert Cucumber JSON to Allure and generate report
async function generateAllureReport() {
    const cucumberJsonPath = './test-results/cucumber-report.json';
    const allureResultsDir = './test-results/allure-results';
    
    console.log('🔄 Converting Cucumber results to Allure format...');
    
    // Ensure allure-results directory exists
    if (!fs.existsSync(allureResultsDir)) {
        fs.mkdirSync(allureResultsDir, { recursive: true });
    }
    
    try {
        // Check if Cucumber JSON exists
        if (!fs.existsSync(cucumberJsonPath)) {
            console.error(`❌ Cucumber JSON file not found: ${cucumberJsonPath}`);
            return;
        }
        
        // Read and convert Cucumber JSON to Allure format
        const cucumberData = JSON.parse(fs.readFileSync(cucumberJsonPath, 'utf8'));
        
        cucumberData.forEach((feature: any, featureIndex: number) => {
            if (!feature.elements || feature.elements.length === 0) return;
            
            feature.elements.forEach((scenario: any, scenarioIndex: number) => {
                const testUuid = randomUUID();
                const containerUuid = randomUUID();
                
                // Calculate timing and status
                const startTime = Date.now() - 300000;
                let totalDuration = 0;
                let scenarioStatus = 'passed';
                let errorMessage = '';
                const allureSteps: any[] = [];
                
                // Process steps
                if (scenario.steps && scenario.steps.length > 0) {
                    scenario.steps.forEach((step: any, stepIndex: number) => {
                        const stepDuration = step.result?.duration ? Math.floor(step.result.duration / 1000000) : 1000;
                        totalDuration += stepDuration;
                        
                        const stepStatus = step.result?.status || 'passed';
                        if (stepStatus === 'failed') {
                            scenarioStatus = 'failed';
                            errorMessage = step.result?.error_message || `Step failed: ${step.name}`;
                        }
                        
                        allureSteps.push({
                            name: step.name || `Step ${stepIndex + 1}`,
                            status: stepStatus,
                            stage: 'finished',
                            start: startTime + (stepIndex * 1000),
                            stop: startTime + (stepIndex * 1000) + stepDuration
                        });
                    });
                }
                
                // Create Allure test result
                const testResult = {
                    uuid: testUuid,
                    name: scenario.name || `Scenario ${scenarioIndex + 1}`,
                    fullName: `${feature.name || 'Feature'} > ${scenario.name || 'Scenario'}`,
                    start: startTime,
                    stop: startTime + totalDuration,
                    status: scenarioStatus,
                    statusDetails: scenarioStatus === 'failed' ? {
                        message: errorMessage,
                        trace: errorMessage
                    } : {},
                    stage: 'finished',
                    steps: allureSteps,
                    labels: [
                        { name: 'suite', value: feature.name || 'Test Suite' },
                        { name: 'feature', value: feature.name || 'Feature' },
                        { name: 'story', value: scenario.name || 'Story' }
                    ]
                };
                
                // Add tags as labels
                if (scenario.tags && scenario.tags.length > 0) {
                    scenario.tags.forEach((tag: any) => {
                        testResult.labels.push({
                            name: 'tag',
                            value: tag.name?.replace('@', '') || tag
                        });
                    });
                }
                
                // Write Allure files
                fs.writeFileSync(
                    path.join(allureResultsDir, `${testUuid}-result.json`),
                    JSON.stringify(testResult, null, 2)
                );
                
                const container = {
                    uuid: containerUuid,
                    name: feature.name || 'Feature Container',
                    start: startTime,
                    stop: startTime + totalDuration,
                    children: [testUuid]
                };
                
                fs.writeFileSync(
                    path.join(allureResultsDir, `${containerUuid}-container.json`),
                    JSON.stringify(container, null, 2)
                );
            });
        });
        
        console.log('✅ Cucumber results converted to Allure format');
        console.log('🚀 Use "npm run report" to view the interactive Allure report');
        
    } catch (error: any) {
        console.error('❌ Error generating Allure report:', error.message);
    }
}

// Run the conversion
generateAllureReport();
