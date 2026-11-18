// Merges the upstream Gruvbox Material Dark theme with personal overrides.
// Usage: node scripts/build.js
const fs = require("fs");
const path = require("path");

const dir = path.join(__dirname, "..", "themes");
const base = JSON.parse(fs.readFileSync(path.join(dir, "gruvbox-material-dark.base.json"), "utf8"));
const overrides = JSON.parse(fs.readFileSync(path.join(dir, "overrides.json"), "utf8"));

// Swap generic selectors for specific ones (see overrides.replaceScopes).
const replace = overrides.replaceScopes || {};
const baseTokenColors = base.tokenColors.map((rule) => {
  if (!rule.scope) return rule;
  const scopes = (Array.isArray(rule.scope) ? rule.scope : rule.scope.split(",")).map((s) => s.trim());
  if (!scopes.some((s) => s in replace)) return rule;
  return { ...rule, scope: scopes.flatMap((s) => replace[s] || [s]).join(", ") };
});

const theme = {
  ...base,
  name: "Gruvbox Flutter Theme",
  colors: { ...base.colors, ...overrides.colors },
  // Later rules win at equal scope specificity, so overrides go last.
  tokenColors: [...baseTokenColors, ...overrides.tokenColors.map((r) => ({ name: "Custom override", ...r }))],
};

fs.writeFileSync(path.join(dir, "gruvbox-flutter-theme.json"), JSON.stringify(theme, null, "\t") + "\n");
console.log(`Built: ${Object.keys(theme.colors).length} colors, ${theme.tokenColors.length} token rules`);
