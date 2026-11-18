// Merges the upstream Gruvbox Material Dark theme with personal overrides.
// Usage: node scripts/build.js
const fs = require("fs");
const path = require("path");

const dir = path.join(__dirname, "..", "themes");
const base = JSON.parse(fs.readFileSync(path.join(dir, "gruvbox-material-dark.base.json"), "utf8"));
const overrides = JSON.parse(fs.readFileSync(path.join(dir, "overrides.json"), "utf8"));

const theme = {
  ...base,
  name: "Gruvbox Material Dark Custom",
  colors: { ...base.colors, ...overrides.colors },
  // Later rules win at equal scope specificity, so overrides go last.
  tokenColors: [...base.tokenColors, ...overrides.tokenColors.map((r) => ({ name: "Custom override", ...r }))],
};

fs.writeFileSync(path.join(dir, "gruvbox-material-dark-custom.json"), JSON.stringify(theme, null, "\t") + "\n");
console.log(`Built: ${Object.keys(theme.colors).length} colors, ${theme.tokenColors.length} token rules`);
