# Change theme, colors & fonts

## Quick brand (no CSS)

1. Edit `.env.local`:
   - `NEXT_PUBLIC_SHOP_NAME`
   - `NEXT_PUBLIC_HOME_PAGE_TITLE`
   - `NEXT_PUBLIC_HOME_PAGE_DESCRIPTION`
2. Add `public/logo.png` for nav/footer logo.
3. `npm run storefront:build && npm run dev`

## Colors & fonts (CSS variables)

1. Open or create **`theme-overrides.css`** in the project root.
2. Override `:root` variables (see `.cursor/rules/customize-theme.mdc`):
   - Brand: `--color-brand-accent`, `--color-brand-accent-hover`, `--color-brand-pink`
   - Text: `--color-text-heading`, `--color-text-body`, `--color-text-muted`
   - Surfaces: `--color-page-bg`, `--color-footer-bg`, `--color-surface-muted`
   - Fonts: `--font-sans`, `--font-heading`, `--font-display`
3. Rebuild: `npm run storefront:build && npm run dev`

## Hero & section content

Configure in **Medusa Admin** dynamic-config (`homepage-config`). Schema: `backend/config/homepage-config.json`.

## Switch full theme preset (advanced)

Default build uses `impulse.css`. Switching to `valero.css` alone breaks hero/nav styling unless you fork `@pradip1995/segment-tokens`. Prefer `theme-overrides.css` for rebrand.
