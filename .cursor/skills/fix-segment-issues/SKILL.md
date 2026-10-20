---
name: fix-segment-issues
description: Diagnose and fix broken storefront segments, missing CSS, empty sections, 404 assets, or Medusa API errors in a create-storefront-app project. Use when hero looks wrong, sections unstyled, or data not loading.
---

# Fix segment issues

## When to use

User reports: broken hero, no CSS, empty sections, 404 images, or storefront not matching demo-store.

## Diagnosis order

### 1. Stale build

```bash
npm run storefront:build
npm run dev
```

### 2. API key / backend

Check `.env.local`:

- `NEXT_PUBLIC_MEDUSA_PUBLISHABLE_KEY` is valid `pk_...`
- Backend URL correct and running
- `NEXT_PUBLIC_DEFAULT_REGION` exists in Medusa

Terminal symptom: repeated `Received response with status 400`.

### 3. Missing CSS

Check `.generated-app/app/layout.tsx` imports:

```tsx
import "@pradip1995/segment-tokens/themes/impulse.css"
```

If it imports only `theme.css` without full impulse rules, upgrade `@pradip1995/framework-compiler` to `^0.2.2` and rebuild.

Symptom: hero shows raw text, nav not styled, shop-by-category flat.

### 4. Missing static assets

404 on `/theme-defaults/valero/*.svg` → add files under `public/theme-defaults/valero/` or upgrade `@pradip1995/segment-assets@^0.2.1`.

### 5. Empty segment with working API

- Products needed for carousels (catalog + region)
- Dynamic-config in Medusa for hero/testimonials
- Confirm backend is running and `/store/dynamic-config` returns expected JSON

### 6. Version drift

Align framework + components patch versions, reinstall, rebuild:

```bash
npm install @pradip1995/framework-compiler@^0.2.2 @pradip1995/segment-tokens@^0.2.1
npm run storefront:build
```

## Fix in packages, not client

Logic bugs in `@pradip1995/segment-*` or `workflow-*` → fix upstream repo, publish npm, bump dep here.

## Reference

See `.cursor/commands/fix-segment-issue.md` for full checklist.
