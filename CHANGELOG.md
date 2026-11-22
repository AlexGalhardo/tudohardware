# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Removed

- **docs:** drop `README.md`, `CODE_OF_CONDUCT.md`, `CONTRIBUTING.md` and `SECURITY.md` from the root; the previous tree is kept on the `legacy` branch

## [0.2.0] - 2026-11-14

### Added

- **adr:** record the astro migration decisions ([e8852c5](https://github.com/AlexGalhardo/tudohardware/commit/e8852c5e3be5a29c47ae4ed0b760936fca5c568b))
- **astro:** spike proving one static category page ([a6e77ee](https://github.com/AlexGalhardo/tudohardware/commit/a6e77ee4b93ac8639ce3e5ab55ac3a57966adf3f))
- **astro:** root layout ([9b5c64d](https://github.com/AlexGalhardo/tudohardware/commit/9b5c64d72dedecbc5ac5b532557ab1c800c47830))
- **astro:** render the home and category pages statically ([61b343f](https://github.com/AlexGalhardo/tudohardware/commit/61b343f42453df859cb59cc5e74db4c64256a963))
- **astro:** render the product pages statically ([fc6114e](https://github.com/AlexGalhardo/tudohardware/commit/fc6114e83136239abd157123aeea1d969e892ab8))
- **astro:** render the text pages statically ([a417db5](https://github.com/AlexGalhardo/tudohardware/commit/a417db5978fff7823587bb0287f5442ccc45d1fc))
- **astro:** a real 404 page ([869d484](https://github.com/AlexGalhardo/tudohardware/commit/869d484cb4084e5106094e67304b8d66af40fd3c))
- **test:** check the built pages have title and canonical and no next assets ([eb7843a](https://github.com/AlexGalhardo/tudohardware/commit/eb7843a5e62a5be71e69ba4a71bba19122ee6773))
- **astro:** contact page and its API route (removed again in the static cutover) ([c285cc5](https://github.com/AlexGalhardo/tudohardware/commit/c285cc599987218bcc8f974c852cfc8357d7d99a))
- **adr:** record where the astro public site migration stopped ([00f6c65](https://github.com/AlexGalhardo/tudohardware/commit/00f6c6516c069a3fdcdeaf28241249b3eb68ef65))
- **pages:** serve the static site under a configurable base path (BASE_PATH, default /tudohardware) for GitHub Pages ([8ae6300](https://github.com/AlexGalhardo/tudohardware/commit/8ae630060e286e871322362f45c60ba9a015641d))
- **docker:** serve the static build with Caddy ([ad0d894](https://github.com/AlexGalhardo/tudohardware/commit/ad0d894175333671a59df6959fe0bb4f891b71cb))
- **ci:** CI, GitHub Pages deploy and release workflows ([fe3fc20](https://github.com/AlexGalhardo/tudohardware/commit/fe3fc200e6f4825e260b51f019a474812eef9ab0))

### Changed

- **ui:** replace next/link with anchors ([0364bd5](https://github.com/AlexGalhardo/tudohardware/commit/0364bd5d51fc9df88252a3a15ef85c50f1d5fa0e))
- **ui:** replace next/image with img ([5a4276d](https://github.com/AlexGalhardo/tudohardware/commit/5a4276dd6f3565af159037efbaf01362bc7160bf))
- **ui:** drop next-themes, next/navigation and next/script from the shared components ([7b8c50f](https://github.com/AlexGalhardo/tudohardware/commit/7b8c50f41b1667f445c3bb370e2f7b74659fd46d))
- **docs:** describe the static Astro site, Docker, Pages and the release flow ([a707b22](https://github.com/AlexGalhardo/tudohardware/commit/a707b2239547ae01003e5016c038c5b02d1d5fc6))

### Removed

- **next:** Next.js, the admin panel, the contact form and the Vercel adapter; the site is static only (breaking) ([eb4c67a](https://github.com/AlexGalhardo/tudohardware/commit/eb4c67ab071085205c5ee144c15e48c6ab978329))

## [0.1.0] - 2026-11-09

### Added

- **site:** product comparison site with spec sheets and affiliate links ([866060e](https://github.com/AlexGalhardo/tudohardware/commit/866060e8fdee81864b27eb02f9833e08113462d5))
- **links:** route affiliate links through the links dashboard and add project tooling ([f6d1e56](https://github.com/AlexGalhardo/tudohardware/commit/f6d1e5695ff7551580406c39abd15938c705de99))
- **links:** fall back to the store address when the links dashboard is down ([d4f4279](https://github.com/AlexGalhardo/tudohardware/commit/d4f4279347dc67db883e64e1d4e70387bd421700))
- **admin:** product panel with Google sign-in, export, docs, setups and infra ([59ed399](https://github.com/AlexGalhardo/tudohardware/commit/59ed399f4cf025ecb58fd8e1d836d746de1ad7e6))
- **build:** environment check at build time and redirect of unknown addresses to the home page ([7bf97bc](https://github.com/AlexGalhardo/tudohardware/commit/7bf97bc5cfd8b5464ea72bfad9cb89f8bae971c9))
- **admin:** show the product photo beside its name ([52979cf](https://github.com/AlexGalhardo/tudohardware/commit/52979cf0ea447ba4605fe448421800fb45f671ca))
- **agents:** agent rules, skills, agents and references ([90e27e3](https://github.com/AlexGalhardo/tudohardware/commit/90e27e378962c2467bc70ca3745cebe43a5f44e8))
- **contact:** contact page, script scraper blocking and page copy protection ([568640d](https://github.com/AlexGalhardo/tudohardware/commit/568640dd3bd0c3bf2b9e55872f2a6e8c8476049b))
- **docs:** contributing, code of conduct and security policy ([99ff1d6](https://github.com/AlexGalhardo/tudohardware/commit/99ff1d612915ad6c7a76c0a81e3791cc530f7731))

### Changed

- **agents:** adapt the agent rules and project skills to this project ([dd804df](https://github.com/AlexGalhardo/tudohardware/commit/dd804df35b25f2bcfd256dff2b972528814e4302))
- **docs:** restructure the README like the workspace reference ([c2dafdd](https://github.com/AlexGalhardo/tudohardware/commit/c2dafdd1881c01830f2355d58b76cf7a6a18ed76))
- **docs:** record the open source files and the next.js security patch in the changelog ([87db6ec](https://github.com/AlexGalhardo/tudohardware/commit/87db6ec16754bf99e2a89a753f9cc28d31999b91))

### Fixed

- **docs:** repair markdown tables and run markdownlint in the pre-commit hook ([b6a49f7](https://github.com/AlexGalhardo/tudohardware/commit/b6a49f7b49844d27bfa994b8f2fe15e814e2f32e))
- **admin:** end the session on sign-out ([77c59ec](https://github.com/AlexGalhardo/tudohardware/commit/77c59ecf96f5877f9fe38fda35e5c5010f072564))
- **contact:** limit name to 4-16 and e-mail to 12-48 characters ([6299073](https://github.com/AlexGalhardo/tudohardware/commit/6299073db5ab781c44a4cdfbce2f49423c5a683b))
- **deps:** bump next to 16.4.6 ([fd0ebbd](https://github.com/AlexGalhardo/tudohardware/commit/fd0ebbd7133050daaae41b5eb13f1d24854d80d0))

### Removed

- **contact:** the contact page, resend and the telegram bot ([28fbda4](https://github.com/AlexGalhardo/tudohardware/commit/28fbda4e6a10d5fe9e6a29b0a87d85d3da21b27a))
- **repo:** the leftover api/indexnow.http file ([486876e](https://github.com/AlexGalhardo/tudohardware/commit/486876ed94c96cdc480c409f132c780726c808af))
- **specs:** the empty place-mae-specs file ([97e336c](https://github.com/AlexGalhardo/tudohardware/commit/97e336cae20c841cf9e5638c5c2d52485aa4dc99))

[Unreleased]: https://github.com/AlexGalhardo/tudohardware/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/AlexGalhardo/tudohardware/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/AlexGalhardo/tudohardware/releases/tag/v0.1.0
