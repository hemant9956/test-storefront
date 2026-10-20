# Update home sections

## Reorder or remove

Edit `pages.config.json` → route `/` → `segments` array.

```json
"segments": [
  "@pradip1995/segment-hero",
  "@pradip1995/segment-new-arrivals",
  "@pradip1995/segment-features"
]
```

Remove unused packages from `package.json`, then:

```bash
npm install
npm run storefront:build
npm run dev
```

## Add a segment

1. Pick package from `@pradip1995/segment-*` (npm).
2. Add to `package.json` dependencies.
3. Append to home `segments` in `pages.config.json`.
4. `npm install && npm run storefront:build && npm run dev`

## Available home segments (full preset)

- `segment-hero` — banner
- `segment-shop-by-category` — category grid
- `segment-new-arrivals` — product carousel
- `segment-promotional-banners` — promo tiles
- `segment-collections-showcase` — collection tabs
- `segment-why-choose-us` — feature icons
- `segment-bestsellers-carousel` — bestsellers
- `segment-reviews-marquee` — testimonials
- `segment-features` — trust strip

## Metadata

Set page title/description on the home route:

```json
"metadata": { "title": "Home", "description": "Welcome" }
```

Rebuild to apply in `.generated-app`.
