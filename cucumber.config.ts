// cucumber.config.ts - Alternative TypeScript configuration

const config = {
    // Feature file paths
    paths: [
        'src/test/features/*/API/*.feature',
        'src/test/features/*/UI/*.feature'
    ],
    
    // Step definition glue paths (where Cucumber looks for step definitions)
    require: [
        'src/test/steps/*/API/*.steps.ts',
        'src/test/steps/*/UI/*.steps.ts',
        'src/test/hooks/**/*.ts'
    ],
    
    // TypeScript support
    requireModule: ['ts-node/register'],
    
    // Output formats
    format: [
        'progress-bar',
        'json:test-results/cucumber-report.json',
        'html:test-results/cucumber-report.html',
        '@cucumber/pretty-formatter'
    ],
    
    // Parallel execution
    parallel: 1,
    
    // Retry configuration
    retry: 0,
    retryTagFilter: '@flaky',
    
    // Tag filtering
    tags: 'not @ignore',
    
    // World parameters (shared data)
    worldParameters: {
        environment: process.env.NODE_ENV || 'test',
        timeout: 30000
    },
    
    // Format options
    formatOptions: {
        snippetInterface: 'async-await',
        snippetSyntax: 'typescript'
    }
};

export default config;