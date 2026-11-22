# Arquitetura

Site de fichas técnicas e comparação de produtos, com links de afiliado. Astro 7 com saída 100% estática, sem banco de dados e sem servidor: o conteúdo são arquivos JSON versionados no repositório.

## Pastas

| Caminho | Papel |
| --- | --- |
| `data/*.json` | Um array de produtos por categoria. Fonte única do conteúdo |
| `lib/data.ts` | `categories` e o mapa categoria → dados importados no build |
| `lib/types.ts`, `lib/specs/`, `lib/spec-configs.ts` | Tipos de produto e seções de especificação por categoria |
| `astro/pages/` | Páginas: home, `[category]`, `[category]/[productId]`, textos legais e 404 |
| `astro/layouts/Root.astro` | Layout raiz: metadados, canonical, tema, analytics |
| `components/` | Ilhas React (comparação, busca, navbar, rodapé) e `components/ui` (shadcn) |
| `lib/base.ts` | `withBase`/`stripBase`: todo link interno passa por aqui para respeitar o `base` |
| `lib/affiliate-links.ts` | Contrato com o dashboard de links (mesmo arquivo em todos os sites) |
| `lib/affiliate-catalogue.ts`, `hooks/use-dashboard-down.ts` | Id e `href` de cada botão de loja, e o desvio para a loja quando o dashboard cai |
| `scripts/` | Passos do build: `sync-links`, `create-sitemap`, `data-jsons-stats` |
| `Dockerfile`, `Caddyfile`, `docker-compose.yml` | Imagem estática (bun builda, Caddy serve) |
| `.github/workflows/` | `ci.yml`, `pages.yml` e `release.yml` |
| `docs/prompts/` | Prompts usados para gerar o JSON de cada categoria |

## Base e site

`astro.config.ts` fixa `site: https://tudohardware.com` e `base` vindo de `BASE_PATH` (padrão `/`, a raiz do domínio próprio). A imagem Docker também builda com `BASE_PATH=/`. Em componentes, nunca escreva `href="/..."`: use `withBase("/...")`.

## Fluxo de uma página

1. `getStaticPaths` em `astro/pages/[category]/[productId].astro` gera uma página por produto de `data/`.
2. O id da categoria na URL vem de `categories` (`lib/data.ts`), não do nome do arquivo: `smart-tvs` lê `data/smartvs.json`.
3. Os botões de loja usam `productAffiliateHref`, que aponta para o redirect do dashboard de links.
4. Endereço que não é página cai na `404.astro` (no Pages) ou no `handle_errors` do Caddy (Docker).

## Fluxo do conteúdo

Edite `data/*.json` e faça commit. O push na `main` roda `pages.yml`, que builda e publica. O build roda `scripts/sync-links.ts`, que registra o catálogo no dashboard quando `LINKS_DASHBOARD_TOKEN` existe (e só valida o catálogo sem ele).

## Decisões

| Decisão | Motivo |
| --- | --- |
| Conteúdo em JSON no repositório, sem banco | Histórico e rollback pelo git; site 100% estático |
| Sem painel, API ou formulário de contato | Saída estática não tem servidor; o painel e o contato foram removidos junto com o Next.js |
| Links de afiliado só pelo dashboard | Contagem de cliques e troca de link morto sem rebuild |
| Desvio para a loja quando o dashboard cai | A venda não pode depender de outro serviço |
