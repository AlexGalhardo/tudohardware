# Production image of the static site: bun builds dist/, Caddy serves it.
#   docker build -t tudohardware .
#   docker run --rm -p 8080:80 tudohardware
FROM oven/bun:1.4.4 AS build

WORKDIR /app

# Dependencies first: this layer is reused while package.json and bun.lock do not change.
# --ignore-scripts skips the husky "prepare" hook, which needs a git checkout.
COPY package.json bun.lock ./
RUN bun install --frozen-lockfile --ignore-scripts

COPY . .

# Served at the root of its own origin, same as the custom domain.
# Without LINKS_DASHBOARD_TOKEN the build only validates the links catalogue and sends nothing.
ENV BASE_PATH=/
RUN bun run build

FROM caddy:2.11.9-alpine

COPY Caddyfile /etc/caddy/Caddyfile
COPY --from=build /app/dist /srv

EXPOSE 80
