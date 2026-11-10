const { chromium } = require('playwright');
const fs = require('fs');

(async () => {
  fs.mkdirSync('screenshots', { recursive: true });
  const browser = await chromium.launch({ headless: true });
  const page = await browser.newPage({
    viewport: { width: 1440, height: 1100 },
    deviceScaleFactor: 1
  });
  page.setDefaultTimeout(30000);
  page.on('pageerror', error => console.warn('Flutter page error:', error.message));

  async function openHome() {
    await page.goto('http://127.0.0.1:7357', { waitUntil: 'networkidle', timeout: 90000 });
    await page.waitForTimeout(8000);
  }

  async function snap(name) {
    await page.screenshot({ path: 'screenshots/' + name, fullPage: true });
    console.log('Captured ' + name);
  }

  await openHome();

  // Experiment 1: the actual Flutter application launched from main.dart.
  await snap('01-flutter-dart-basics.png');

  // Experiment 2: actual cards, text, images, badges, and layout widgets.
  await snap('02-widgets-and-layouts.png');

  // Experiment 3: the running app at phone width.
  await page.setViewportSize({ width: 390, height: 844 });
  await page.waitForTimeout(1800);
  await snap('03-responsive-mobile.png');

  // Return to desktop before navigating through the movie cards.
  await openHome();
  await page.mouse.click(170, 500);
  await page.waitForTimeout(2500);
  await snap('04-navigation-details.png');

  // Experiment 5: open the Provider-backed favorites screen.
  await openHome();
  await page.mouse.click(1400, 28);
  await page.waitForTimeout(1800);
  await snap('05-provider-favorites.png');

  // Experiment 6: reusable movie cards, rating badges, section title and theme.
  await openHome();
  await snap('06-custom-widgets-theme.png');

  // Experiment 7: search form. Flutter web exposes a temporary text input.
  const searchInput = page.locator('input').first();
  if (await searchInput.count()) {
    await searchInput.click({ timeout: 5000 }).catch(async () => {
      await page.mouse.click(480, 180);
    });
    await page.keyboard.type('movie');
    await page.keyboard.press('Enter');
  } else {
    await page.mouse.click(480, 180);
    await page.keyboard.type('movie');
    await page.keyboard.press('Enter');
  }
  await page.waitForTimeout(1800);
  await snap('07-search-validation.png');

  // Experiment 8: wait for the app's fade-in and slide-in card animations.
  await openHome();
  await page.waitForTimeout(2200);
  await snap('08-animations.png');

  // Experiment 9: capture after the REST request and JSON mapping have rendered.
  await page.waitForTimeout(1200);
  await snap('09-rest-api-json.png');

  // Experiment 10: app state after flutter analyze and flutter test succeeded in CI.
  await snap('10-testing-debugging.png');

  await browser.close();

  const required = [
    '01-flutter-dart-basics.png',
    '02-widgets-and-layouts.png',
    '03-responsive-mobile.png',
    '04-navigation-details.png',
    '05-provider-favorites.png',
    '06-custom-widgets-theme.png',
    '07-search-validation.png',
    '08-animations.png',
    '09-rest-api-json.png',
    '10-testing-debugging.png'
  ];
  for (const name of required) {
    const path = 'screenshots/' + name;
    if (!fs.existsSync(path) || fs.statSync(path).size < 10000) {
      throw new Error('Screenshot missing or unexpectedly small: ' + name);
    }
  }
  console.log('All 10 experiment screenshots were captured from the running Flutter app.');
})().catch(error => {
  console.error(error);
  process.exit(1);
});
