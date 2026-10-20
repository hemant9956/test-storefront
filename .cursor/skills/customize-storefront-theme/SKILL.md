---
name: customize-storefront-theme
description: Change storefront colors, fonts, logo, and hero branding in a config-only @pradip1995 create-storefront-app project. Use when the user asks to rebrand, change theme, update colors, fonts, logo, or hero styling.
---

# Customize storefront theme

## When to use

User wants to change look-and-feel of a scaffolded storefront (not the medusa-storefront-kit theme package).

## Workflow

1. Read `.cursor/rules/customize-theme.mdc` and `theme-overrides.css` if present.
2. **Content/branding text** → `.env.local`:
   - `NEXT_PUBLIC_SHOP_NAME`
   - `NEXT_PUBLIC_HOME_PAGE_TITLE`
   - `NEXT_PUBLIC_HOME_PAGE_DESCRIPTION`
3. **Logo** → `public/logo.png` or Medusa dynamic-config logo.
4. **Colors & fonts** → edit `theme-overrides.css` at project root:

```css
:root {
  --color-brand-accent: #YOUR_BRAND;
  --color-brand-accent-hover: #YOUR_BRAND_DARK;
  --color-text-heading: #1a1a1a;
  --font-sans: "Your Font", sans-serif;
  --font-heading: "Your Display Font", serif;
}
```

5. Always run after CSS/env changes:

```bash
npm run storefront:build
npm run dev
```

## Do not

- Edit `.generated-app/` directly
- Switch to `valero.css` alone (breaks hero/nav component CSS)
- Put secrets in committed files

## Medusa content

Hero images and promo copy often come from Medusa **dynamic-config** (`homepage-config`), not from this repo. Point user to Medusa Admin if content is wrong but styling is fine.
