# Fluxos de trabalho

## Mudança de código

1. Edite e rode `bun run ci`.
2. Registre a mudança em `## [Unreleased]` no `CHANGELOG.md`.
3. Commit e push. O CI roda em todo push e pull request.

## Commits

Conventional Commits em inglês, validados pelo commitlint: `tipo(escopo): descrição no imperativo`. Linhas do corpo com até 100 caracteres. Tipos: `feat`, `fix`, `docs`, `chore`, `build`, `test`, `refactor`, `perf`, `ci`.

## Versão e release

SemVer: `feat` sobe a minor, `fix` e os demais sobem a patch, `!` ou `BREAKING CHANGE:` sobe a major.

```bash
# 1. CHANGELOG.md: mova Unreleased para "## [X.Y.Z] - AAAA-MM-DD" (itens "- **escopo:** texto ([sha](link))")
# 2. package.json: "version": "X.Y.Z"
git commit -am "docs: release X.Y.Z"
git tag -a vX.Y.Z -m "vX.Y.Z"
git push origin main vX.Y.Z
```

O push da tag estável dispara `release.yml`: cria o GitHub Release com a seção da versão no `CHANGELOG.md` e publica a imagem `X.Y.Z`, `X.Y` e `latest` em `ghcr.io/alexgalhardo/tudohardware` e no Docker Hub (variável `DOCKERHUB_USERNAME` e segredo `DOCKERHUB_TOKEN` do repositório).

## Deploy

GitHub Pages, por `pages.yml`, a cada push na `main`: <https://alexgalhardo.github.io/tudohardware>. Ative em Settings → Pages → Source: GitHub Actions. O build precisa passar; se o dashboard de links recusar o catálogo (com `LINKS_DASHBOARD_TOKEN` definido), o build falha e o site continua na versão anterior.

## Conteúdo

Edite `data/<arquivo>.json`. O `id` é único na categoria; todo produto precisa de ao menos um link `https://`. `bun run sync-links` valida.

**Categoria nova:** arquivo em `data/`, entrada em `categories` e no mapa de `lib/data.ts` e em `categoryFileMap` de `scripts/create-sitemap.ts`.

## Links de afiliado

O contrato com o dashboard de links está no `README.md` da branch `legacy` ("Links de afiliado"). A variável é `LINKS_DASHBOARD_TOKEN`, a mesma em todos os sites. `lib/affiliate-links.ts` é o mesmo arquivo nos outros sites: mudou aqui, mude lá.
