import * as fs from 'fs';
import archiver from 'archiver';
const report = require('multiple-cucumber-html-reporter');

const reportConfig = {
  jsonDir: 'test-results', // Path to the directory containing the JSON files
  reportPath: 'test-results/combined-report', // Path to the directory where the report will be saved
  reportName: 'Playwright Automation Report',
  pageTitle: 'illum Application',
  displayDuration: true,
  metadata: {
    browser: {
      name: 'chrome',
      version: '118',
    },
    device: 'gopi - laptop',
    platform: {
      name: 'mac',
      version: '14.0',
    },
  },
  customData: {
    title: 'Test info',
    // Replace the label names for every release
    data: [
      { label: 'Project', value: 'Custom project' },
      { label: 'Release', value: '1.2.3' },
      { label: 'Cycle', value: 'B11221.34321' },
    ],
  },
};

try {
  report.generate(reportConfig);
} catch (error) {
  console.error('Error generating report:', error);
}


const output = fs.createWriteStream('test-results/combined-report.zip');
const archive = archiver('zip', { zlib: { level: 9 } });

archive.on('warning', (err) => {
  if (err.code === 'ENOENT') {
    console.warn(err);
  } else {
    throw err;
  }
});

archive.on('error', (err) => {
  throw err;
});

archive.pipe(output);
archive.directory('test-results/combined-report', 'combined-report');
archive.finalize();
