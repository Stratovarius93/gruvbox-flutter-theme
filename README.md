# Gruvbox Material Dark Custom

Personal variant of [Gruvbox Material](https://github.com/sainnhe/gruvbox-material-vscode) by [sainnhe](https://github.com/sainnhe) — only the **Dark** theme (medium contrast), with custom workbench and syntax colors baked in, so no `workbench.colorCustomizations` are needed in `settings.json`.

## Structure

- `themes/gruvbox-material-dark.base.json` — upstream theme (v6.5.2, generated output, medium contrast)
- `themes/overrides.json` — personal changes (`colors` + `tokenColors`)
- `themes/gruvbox-material-dark-custom.json` — merged theme (generated, do not edit by hand)

## Edit colors

1. Edit `themes/overrides.json`
2. `npm run package` → produces `gruvbox-material-custom-x.y.z.vsix`
3. Install: Command Palette → **Extensions: Install from VSIX...** (or `antigravity --install-extension <file>.vsix`)

## Credits

Based on Gruvbox Material © 2020 sainnhe, MIT License.
