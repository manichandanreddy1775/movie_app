const { chromium } = require('playwright');
const fs = require('fs');

(async () => {
  fs.mkdirSync('screenshots', { recursive: true });
  const browser = await chromium.launch({ headless: true });
  const page = await browser.newPage({ viewport: { width: 1440, height: 1100 }, deviceScaleFactor: 1 });
  page.setDefaultTimeout(30000);

  const errors = [];
  page.on('pageerror', error => errors.push(error.message));

  await page.goto('http://127.0.0.1:7357', { waitUntil: 'networkidle', timeout: 90000 });
  await page.waitForTimeout(7000);

  // The screenshots are browser captures of the compiled Flutter application.
  await page.screenshot({ path: 'screenshots/01-home-screen.png', fullPage: true });

  // Capture the same running app at a phone-sized viewport to document responsive layout.
  await page.setViewportSize({ width: 390, height: 844 });
  await page.waitForTimeout(1500);
  await page.screenshot({ path: 'screenshots/02-responsive-mobile.png', fullPage: true });

  // A tablet-sized viewport provides a separate responsive-layout evidence image.
  await page.setViewportSize({ width: 820, height: 1024 });
  await page.waitForTimeout(1000);
  await page.screenshot({ path: 'screenshots/03-responsive-tablet.png', fullPage: true });

  await browser.close();

  for (const name of ['01-home-screen.png', '02-responsive-mobile.png', '03-responsive-tablet.png']) {
    if (!fs.existsSync('screenshots/' + name) || fs.statSync('screenshots/' + name).size < 10000) {
      throw new Error('Screenshot missing or unexpectedly small: ' + name);
    }
  }
  if (errors.length) console.warn('Browser page errors:', errors.join('\n'));
  console.log('Captured screenshots from the compiled Flutter app.');
})().catch(error => {
  console.error(error);
  process.exit(1);
});
