---
name: update-storefront-sections
description: Add, remove, or reorder homepage and page segments in pages.config.json for a config-only Medusa storefront. Use when changing home sections, adding segments, or updating page composition.
---

# Update storefront sections

## When to use

User wants to change which blocks appear on home, store, PDP, cart, etc.

## Workflow

1. Read `pages.config.json` for the target route.
2. Home sections = `segments` array on `"route": "/"`.
3. To **reorder** — rearrange array entries.
4. To **remove** — delete entry; remove unused dep from `package.json`.
5. To **add**:
   - Add `"@pradip1995/segment-<name>": "^0.2.2"` to `package.json`
   - Append package name to route's `segments`
   - `npm install`
6. Rebuild:

```bash
npm run storefront:build
npm run dev
```

## Common home segments

| Package | Purpose |
|---------|---------|
| segment-hero | Main banner |
| segment-shop-by-category | Category cards |
| segment-new-arrivals | New products carousel |
| segment-promotional-banners | Promo tiles |
| segment-collections-showcase | Collection slider |
| segment-why-choose-us | USP icons |
| segment-bestsellers-carousel | Bestsellers |
| segment-reviews-marquee | Testimonials |
| segment-features | Trust strip |

## Verify

- Build log shows expected segment count
- Dev server home page renders new block
- If empty data, check workflow + Medusa (not just config)

## Do not

- Copy segment source into this repo
- Edit `.generated-app/app/**/page.tsx` manually
