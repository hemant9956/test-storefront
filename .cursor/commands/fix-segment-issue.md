# Fix segment / UI issues

Work through this checklist before changing segment source code.

## 1. Rebuild

```bash
npm run storefront:build
npm run dev
```

Never debug stale `.generated-app/` from an old build.

## 2. Medusa connection

In `.env.local`:

- `NEXT_PUBLIC_MEDUSA_PUBLISHABLE_KEY` must be a real `pk_...` key (not placeholder)
- `MEDUSA_BACKEND_URL` / `NEXT_PUBLIC_MEDUSA_BACKEND_URL` reachable
- `NEXT_PUBLIC_DEFAULT_REGION` matches a region in Medusa (e.g. `in`)

Symptoms of bad key: empty categories, "No new arrivals", generic "Store" fallback text, API 400 in terminal.

## 3. Missing CSS / broken hero layout

Symptoms: hero is plain text, nav not transparent, sections unstyled.

- Confirm `.generated-app/app/layout.tsx` imports `themes/impulse.css`
- Add/fix `theme-overrides.css` only for colors — not layout
- Align package versions: `@pradip1995/framework-compiler@^0.2.2`, `@pradip1995/segment-tokens@^0.2.1`

## 4. Missing images (404)

| Path | Fix |
|------|-----|
| `/theme-defaults/valero/logo.svg` | Add under `public/theme-defaults/valero/` |
| Hero images | Set in Medusa dynamic-config or env fallbacks |
| Product images | Medusa catalog / CDN allowlist in backend |

## 5. Empty segment but API works

- Segment may need workflow data (e.g. new-arrivals needs products with tags)
- Check Medusa Admin dynamic-config for that section's fields
- Confirm `NEXT_PUBLIC_MEDUSA_PUBLISHABLE_KEY` is set and backend `/store/dynamic-config` returns data

## 6. Package version mismatch

```bash
npm ls @pradip1995/framework-compiler @pradip1995/segment-tokens
```

Bump to latest patch, reinstall, rebuild.

## 7. Still broken

Inspect browser Network tab for 404/400. Check terminal Medusa SDK logs. Open issue on the specific `@pradip1995/segment-*` or `workflow-*` package — do not fork segment code into this client repo.
