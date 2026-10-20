# Rebuild storefront

Run after any change to `pages.config.json`, `package.json`, `.env.local`, or `theme-overrides.css`.

```bash
npm run storefront:build
npm run dev
```

Or production:

```bash
npm run build
npm run start
```

**Do not** edit files inside `.generated-app/` — they are overwritten every build.

Verify build output lists your segments. Homepage content is loaded from Medusa Admin via `/store/dynamic-config`, not generated in the storefront build.
