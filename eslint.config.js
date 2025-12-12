const typescriptEslint = require('@typescript-eslint/eslint-plugin');
const typescriptParser = require('@typescript-eslint/parser');

module.exports = [
  {
    files: ['**/*.ts'],
    languageOptions: {
      parser: typescriptParser,
      parserOptions: {
        ecmaVersion: 2020,
        sourceType: 'module',
        project: './tsconfig.json',
      },
    },
    plugins: {
      '@typescript-eslint': typescriptEslint,
    },
    rules: {
      // TypeScript specific rules (auto-fixable)
      '@typescript-eslint/no-unused-vars': ['warn', { 
        'argsIgnorePattern': '^_',
        'varsIgnorePattern': '^_',
        'caughtErrorsIgnorePattern': '^_'
      }],
      '@typescript-eslint/no-explicit-any': 'off',
      '@typescript-eslint/prefer-as-const': 'warn', // auto-fixable
      '@typescript-eslint/no-inferrable-types': 'warn', // auto-fixable
      '@typescript-eslint/no-unnecessary-type-assertion': 'warn', // auto-fixable
      
      // General rules (auto-fixable where possible)
      'prefer-const': 'warn', // auto-fixable
      'no-var': 'warn', // auto-fixable  
      'semi': ['warn', 'always'], // auto-fixable
      'quotes': ['warn', 'single', { 'avoidEscape': true }], // auto-fixable
      'indent': 'off', // Disabled to avoid conflicts
      'no-multiple-empty-lines': ['warn', { 'max': 2 }], // auto-fixable
      'eol-last': ['warn', 'always'], // auto-fixable
      'comma-dangle': ['warn', 'always-multiline'], // auto-fixable
      'object-curly-spacing': ['warn', 'always'], // auto-fixable
      'array-bracket-spacing': ['warn', 'never'], // auto-fixable
      'space-before-function-paren': ['warn', {
        'anonymous': 'always',
        'named': 'never',
        'asyncArrow': 'always'
      }], // auto-fixable
      'arrow-spacing': 'warn', // auto-fixable
      'keyword-spacing': 'warn', // auto-fixable
      'space-infix-ops': 'warn', // auto-fixable
      'no-trailing-spaces': 'warn', // auto-fixable
    },
  },
  {
    files: ['**/*.js'],
    languageOptions: {
      ecmaVersion: 2020,
      sourceType: 'module',
      globals: {
        node: true,
        console: 'readonly',
        process: 'readonly',
      },
    },
    rules: {
      'no-unused-vars': 'warn',
      'prefer-const': 'warn',
      'no-var': 'warn',
      'semi': ['warn', 'always'],
    },
  },
  {
    ignores: [
      'node_modules/**',
      'test-results/**',
      'test-result/**',
      'logs/**',
      '**/*.html',
      '.playwright/**',
      'combined-report/**',
      '.husky/**',
    ],
  },
];