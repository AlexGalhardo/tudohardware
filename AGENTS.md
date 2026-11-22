# AGENTS.md

Instruções para agentes de código neste repositório. O `CLAUDE.md` importa este arquivo; edite sempre aqui.

**Documentação:** o índice de `docs/` está em [`.claude/agents.md`](.claude/agents.md). Para preparar o projeto do zero, siga [`docs/agent-setup.md`](docs/agent-setup.md).

## O que é o projeto

Site de fichas técnicas e comparação de produtos com links de afiliado, no ar em <https://tudohardware.com> (GitHub Pages com domínio próprio). Não há banco nem servidor: o conteúdo são os arquivos JSON de `data/`, importados estaticamente, e a saída é 100% estática (Astro).

## Início de toda sessão

1. Carregue as três skills de sessão (em agentes sem ferramenta de skills, leia o `SKILL.md` de cada uma em `.claude/skills/<nome>/`):
   - `using-agent-skills`: o roteador que indica a skill de engenharia de cada tarefa;
   - `karpathy-guidelines`: pensar antes de codar, simplicidade, mudanças cirúrgicas, critérios verificáveis;
   - `ponytail`: a solução mais simples que funciona.
2. Leia o índice em [`.claude/agents.md`](.claude/agents.md) e, dele, só a documentação do assunto em que vai mexer.
3. As regras por assunto ficam em [`.claude/rules/`](.claude/rules/) (o Claude Code as carrega sozinho) e valem tanto quanto as deste arquivo.
4. Antes de usar uma API do Astro de que não tenha certeza, consulte <https://docs.astro.build>.

## Skills, agentes e checklists

Tudo fica em `.claude/`. A origem dos pacotes de terceiros está em [`.claude/skills/SOURCES.md`](.claude/skills/SOURCES.md); o conteúdo deles não é editado aqui.

| Skill do projeto | Quando |
| --- | --- |
| `project-product` | Criar, editar ou remover um produto; categoria nova |
| `project-release` | Fechar uma versão: `CHANGELOG.md`, `package.json` e tag |

As skills de engenharia do pacote agent-skills entram por tarefa, indicadas pelo `using-agent-skills`. As mais comuns aqui: `test-driven-development`, `debugging-and-error-recovery`, `frontend-ui-engineering`, `security-and-hardening`, `code-review-and-quality` e `git-workflow-and-versioning`. Uma não tem uso hoje: `browser-testing-with-devtools` (depende do servidor MCP do Chrome DevTools, não configurado).

As skills `ponytail-*` só entram quando o dono pedir. Os agentes de `.claude/agents/` (`code-reviewer`, `security-auditor`, `test-engineer`, `web-performance-auditor`) são chamados pelo nome como subagentes de revisão; os checklists de `.claude/references/` são consultados por eles e pelas skills do pacote.

## Stack

Astro 7 (estático) · React 19 (ilhas) · TypeScript 7 strict · Tailwind CSS 4 · Radix/shadcn (`components/ui`) · Biome · Bun.

## Mapa

| Caminho | Papel |
| --- | --- |
| `data/*.json` | Um array de produtos por categoria. Fonte única do conteúdo |
| `lib/data.ts` | Categorias (`categories`) e o mapa categoria → arquivo. O id da categoria é o da URL, não o nome do arquivo |
| `lib/specs/`, `lib/spec-configs.ts` | Tipos e seções de especificação por categoria |
| `app/[category]/page.tsx` | Página de comparação da categoria (`?products=`) |
| `app/[category]/[productId]/` | Ficha do produto |
| `components/comparison/` | Cards, tabela e busca da comparação |
| `lib/affiliate-links.ts` | Contrato com o dashboard de links. O mesmo arquivo existe nos outros sites: mude nos dois |
| `lib/affiliate-catalogue.ts` | Como um produto vira id e `href` no dashboard. Importado por componentes de cliente: não importe `lib/data.ts` aqui |
| `scripts/catalogue.ts`, `scripts/sync-links.ts` | Monta o catálogo e o envia ao dashboard antes do build |
| `scripts/create-sitemap.ts`, `data-jsons-stats.ts` | Geram `public/sitemap.xml` e `data-stats.json` no build |
| `components/CopyProtection.tsx` | Bloqueio de cópia no navegador. Não bloqueie buscadores nem crawlers de IA: o site depende de ser encontrado |
| `hooks/use-dashboard-down.ts` | Desvio dos botões para a loja quando o dashboard de links não responde |
| `Dockerfile`, `Caddyfile`, `docker-compose.yml` | Imagem estática: bun builda com `BASE_PATH=/`, Caddy serve o `dist/` |
| `.github/workflows/` | `ci.yml`, `pages.yml` (deploy) e `release.yml` (GitHub Release e imagem no GHCR e Docker Hub) |
| `docs/` | Documentação (índice em `.claude/agents.md`); `docs/prompts/` tem os prompts de geração de JSON |

## Regras

- **Links de afiliado só pelo dashboard.** Use `productAffiliateHref`. O único caso em que o botão aponta direto para a loja é o desvio de `useDashboardDown()`, quando o dashboard não responde. Ver "Links de afiliado" no `README.md` da branch `legacy`.
- **`id` do produto é único na categoria e estável.** Id repetido falha o build; id trocado apaga os cliques do produto no dashboard.
- **Categoria nova:** arquivo em `data/`, entrada em `categories` e no mapa de `lib/data.ts` e em `categoryFileMap` de `scripts/create-sitemap.ts`.
- **Base:** link interno e imagem de `public/` usam `withBase`, nunca `/caminho` solto; o site vive na raiz de `https://tudohardware.com` (`BASE_PATH` padrão `/`). `SITE_URL` em `lib/affiliate-catalogue.ts` continua com o endereço antigo do Pages de propósito: ele é a chave dos produtos no dashboard e trocá-lo apaga os cliques.
- **Segredos:** nada de chave real no repositório. `.env` é ignorado pelo git; `.env.example` só tem placeholders.
- **Dependências:** última versão estável, com versão exata, sem `^` nem `~`. Dependência nova só com aprovação do dono.
- **TypeScript:** sem `any` (o Biome recusa), sem `@ts-ignore`. `bun run typecheck` precisa passar.
- **Variáveis de ambiente:** toda variável nova entra no schema de `lib/env.ts` e em `.env.example`.
- **Lint:** `bun run lint` precisa passar sem erro. `biome-ignore` só com o motivo escrito na mesma linha.
- **Idioma:** código, comentários e commits em inglês; textos de interface e documentação em português do Brasil.

## Antes de entregar

```bash
bun run typecheck
bun run lint
bun run test
bun run lint:md
bun run build
```

`bun run ci` roda os cinco. O hook `pre-commit` roda tipos, lint e markdownlint; o `pre-push` roda o build. Mudança visual é conferida no navegador (`bun run preview`).

## Commits e versões

- Conventional Commits, validados pelo commitlint no hook `commit-msg`.
- SemVer: `feat` sobe a minor, `fix` e os demais sobem a patch, `!` sobe a major.
- Registre a mudança em `## [Unreleased]` no [`CHANGELOG.md`](CHANGELOG.md), com itens `- **escopo:** texto ([sha](link))`. Ao fechar a versão: mova o texto para `## [X.Y.Z] - AAAA-MM-DD`, atualize `version` no `package.json` e crie a tag `vX.Y.Z`; o `release.yml` cria o GitHub Release e publica a imagem.

## Dívida conhecida

- O painel de produtos e o formulário de contato foram removidos com o Next.js (saída estática não tem servidor). Reintroduzi-los exige um backend à parte.
- Não há testes de navegador; `tests/pages.test.ts` só confere o HTML do `dist/`.
