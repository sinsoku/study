const puppeteer = require('puppeteer');
let browser;
beforeEach(async () => browser = await puppeteer.launch());
afterEach(async () => await browser.close());

const timeout = 20 * 60 * 1000; // 20 minutes

displayRanking = async (page) => {
  for(let i = 1; i < 5; i++) {
    await page.evaluate(_ => window.scrollBy(0, document.body.scrollHeight));
    await page.waitFor(`.rank-rankListItem:nth-child(${20 * (i + 1)})`);
  }
};

findTags = async (page, urls) => {
  const tagsArray = [];

  for(let i = 0; i < urls.length; i++) {
    console.log(`${i}: parsing... ${urls[i]}`);

    await page.goto(urls[i]);
    const tags = await page.$$eval('.genreTagList__item', divs => divs.map(div => div.innerText));
    tagsArray.push(tags);
  }

  return tagsArray.flat();
};

test('doujin', async () => {
  const page = await browser.newPage();
  await page.goto('https://www.dmm.co.jp/dc/doujin/-/ranking-all/=/sort=popular/term=monthly/');

  const title = await page.$eval('.c_hdg_withSortTitle', el => el.innerText);
  expect(title).toMatch(/総合ランキング 月間/);

  await displayRanking(page);
  const itemsCount = await page.$$eval('.rank-rankListItem', items => items.length);
  expect(itemsCount).toBe(100);

  const urls = await page.$$eval('.rank-name a', links => links.map(link => link.href));
  const tags = await findTags(page, urls);

  const ranks = {};
  tags.forEach((tag) => {
    if (ranks[tag] === undefined) ranks[tag] = 0;
    ranks[tag] += 1;
  });
  ranks['成人向け'] = 0;
  ranks['男性向け'] = 0;
  const topRanks = Object.entries(ranks).sort((a, b) => b[1] - a[1]).slice(0, 20);

  console.log(topRanks);
}, timeout);
