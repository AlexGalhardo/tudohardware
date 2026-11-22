# tudohardware — índice para agentes

Regras e mapa do código: [`AGENTS.md`](../AGENTS.md). Leia primeiro. Este arquivo lista a documentação de `docs/`; abra só a do assunto em que vai mexer.

| Documento | Quando ler |
| --- | --- |
| [`docs/agent-setup.md`](../docs/agent-setup.md) | Preparar o projeto do zero: Bun, `.env`, Docker, Pages |
| [`docs/architecture.md`](../docs/architecture.md) | Entender pastas, fluxo de uma página, fluxo do conteúdo e as decisões |
| [`docs/tooling.md`](../docs/tooling.md) | Ferramentas, scripts, hooks do git, regras de dependências e formatação |
| [`docs/testing.md`](../docs/testing.md) | O que cada teste cobre, como isolam rede e arquivos, o que não tem teste |
| [`docs/workflows.md`](../docs/workflows.md) | Commits, versão e release, deploy no Pages, conteúdo novo, links de afiliado |
| [`CHANGELOG.md`](../CHANGELOG.md) | Histórico de versões |

`docs/prompts/` guarda os prompts usados para gerar o JSON de cada categoria; não é documentação do código.

## Regras por assunto

Ficam em `.claude/rules/`. O Claude Code as carrega sozinho; outros agentes leem no início da sessão.

| Regra | Assunto |
| --- | --- |
| [`rules/code-style.md`](rules/code-style.md) | Formatação, TypeScript, React, imports, comentários |
| [`rules/content.md`](rules/content.md) | Produtos em `data/*.json`: id, links de loja, categoria nova |
| [`rules/dependencies.md`](rules/dependencies.md) | Versão exata e como instalar |
| [`rules/testing.md`](rules/testing.md) | Regras de teste |
| [`rules/git-and-releases.md`](rules/git-and-releases.md) | Commits, hooks, versões e CI |

## Skills deste projeto

| Skill | Quando usar |
| --- | --- |
| [`project-product`](skills/project-product/SKILL.md) | Criar, editar ou remover um produto; categoria nova |
| [`project-release`](skills/project-release/SKILL.md) | Fechar uma versão: `CHANGELOG.md`, tag e release |

As skills, os agentes e os checklists de terceiros estão descritos no `AGENTS.md`; a origem de cada pacote, em [`skills/SOURCES.md`](skills/SOURCES.md).

Docker em [`Dockerfile`](../Dockerfile) e [`docker-compose.yml`](../docker-compose.yml); workflows em [`.github/workflows/`](../.github/workflows/).
