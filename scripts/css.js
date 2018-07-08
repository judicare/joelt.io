const fs = require('fs');

const jsdom = require("jsdom");

let dirname = process.argv[2];

if (!dirname) {
  console.error("Usage: css.js full/path/to/output/directory");
  process.exit(1);
}

const buf = fs.readFileSync(`${dirname}/index.html`);

const { window } = new jsdom.JSDOM(buf, { resources: "usable", url: `file://${process.argv[2]}/` });

const { document } = window;

window.onload = () => {
  let css = `@charset "UTF-8";\n`;
  let matchesFn = (rule) => {
    try {
      let text = rule.selectorText.split(';');
      let buf = "";
      let selectors = text[text.length - 1].split(',').filter(s => document.querySelector(s) !== null);
      if (selectors.length > 0) {
        buf += `${selectors.join(", ")} {${rule.style.cssText}}\n`;
      }
      return buf;
    } catch (e) {
    }
    return "";
  }
  document.styleSheets.forEach(sheet => {
    sheet.cssRules.forEach(rule => {
      if (rule.media) {
        rule.cssRules.forEach(innerRule => {
          let matchtext = matchesFn(innerRule);
          if (matchtext) {
            css += `@media ${rule.media.mediaText} {`;
            css += matchtext;
            css += `}`;
          }
        });
      } else {
        css += matchesFn(rule);
      }
    })
  });
  console.log(css);
}
