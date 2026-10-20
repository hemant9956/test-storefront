# Classic builder (no BuildKit/buildx). Prefer scripts/docker-build-storefront.sh for host npm.

# Use slim (glibc) — Alpine musl sharp corrupts AVIF product images.
FROM node:24-slim AS builder

RUN apt-get update && apt-get install -y --no-install-recommends \
    libvips42 \
    libheif1 \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package.json .npmrc ./
RUN sh -c 'for i in 1 2 3 4 5 6; do \
      npm install --prefer-offline --no-audit --no-fund --legacy-peer-deps && npm rebuild sharp && exit 0; \
      echo "npm install failed (attempt $$i/6); sleeping $$((i*45))s…"; \
      sleep $$((i*45)); \
    done; exit 1'

COPY pages.config.json storefront.config.json theme-overrides.css ./
COPY public ./public/

RUN npm run storefront:build

WORKDIR /app/.generated-app

RUN sh -c 'for i in 1 2 3 4 5 6; do \
      npm install --prefer-offline --no-audit --no-fund --legacy-peer-deps && npm rebuild sharp && exit 0; \
      echo "npm install failed (attempt $$i/6); sleeping $$((i*45))s…"; \
      sleep $$((i*45)); \
    done; exit 1'

# No BuildKit secrets — bake with empty env; prefer host `make build-storefront` for real keys.
RUN touch .env.production \
    && npm run build \
    && npm prune --omit=dev

FROM node:24-slim AS runner

RUN apt-get update && apt-get install -y --no-install-recommends \
    libvips42 \
    libheif1 \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ENV NODE_ENV=production
ENV PORT=8000

COPY --from=builder /app/.generated-app/package.json ./package.json
COPY --from=builder /app/.generated-app/.next ./.next
COPY --from=builder /app/.generated-app/public ./public
COPY --from=builder /app/.generated-app/next.config.js ./next.config.js
COPY --from=builder /app/.generated-app/node_modules ./node_modules

EXPOSE 8000

CMD ["npm", "run", "start"]
