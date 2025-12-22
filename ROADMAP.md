# Division One SSG Roadmap

This roadmap outlines the development phases for Division One SSG, a satellite repository providing 28 SSG adapters synchronized from the poly-ssg-mcp hub.

## Current Status

**Version**: 0.1.0
**Phase**: v0.2 - Security Hardening
**Overall Completion**: 45%

---

## Phase 1: Foundation (v0.1) - COMPLETE

- [x] Repository initialization with RSR compliance
- [x] SCM configuration files (META.scm, ECOSYSTEM.scm, STATE.scm)
- [x] GitHub workflows (CodeQL security scanning)
- [x] Dependabot configuration for automated updates
- [x] License setup (MIT OR AGPL-3.0-or-later)
- [x] Basic documentation structure

---

## Phase 2: Security Hardening (v0.2) - IN PROGRESS

- [x] Security audit of adapter code
- [x] Update SECURITY.md with proper values
- [x] Update CODE_OF_CONDUCT.md
- [x] Update CONTRIBUTING.md
- [x] Fix SCM files to reference correct project name
- [ ] Add input validation to adapters
- [ ] Document security best practices

**Security Findings** (v0.2):
- Adapters use secure `Deno.Command` with array-based args (no command injection risk)
- No shell interpolation in command execution
- SPDX headers present in all adapter files

---

## Phase 3: Documentation (v0.3) - PENDING

- [ ] Complete README.adoc with full project documentation
- [ ] Add adapter-specific documentation
- [ ] Create usage examples for each SSG
- [ ] Document MCP integration patterns
- [ ] Add architecture documentation
- [ ] Create getting started guide

---

## Phase 4: Testing (v0.4) - PENDING

- [ ] Unit tests for adapter utilities
- [ ] Integration tests for adapter connections
- [ ] Mock SSG binary testing
- [ ] CI test automation
- [ ] Code coverage reporting (target: 70%)

---

## Phase 5: Enhanced Adapters (v0.5) - PENDING

- [ ] Add error handling improvements
- [ ] Implement adapter health checks
- [ ] Add configuration validation
- [ ] Support for adapter-specific options
- [ ] Performance optimizations

---

## Phase 6: MCP Server (v0.6) - PENDING

- [ ] Standalone MCP server implementation
- [ ] Multi-adapter support
- [ ] Dynamic adapter loading
- [ ] Configuration management
- [ ] CLI interface

---

## Phase 7: Production Ready (v1.0) - FUTURE

- [ ] Complete documentation
- [ ] Full test coverage
- [ ] Performance benchmarks
- [ ] Security audit
- [ ] Release automation
- [ ] Semantic versioning

---

## Supported SSGs (28)

| Language | SSGs |
|----------|------|
| Rust | Zola, Cobalt, mdBook |
| Haskell | Hakyll, Ema |
| Elixir | Serum, NimblePublisher, Tableau |
| Julia | Franklin, Documenter, StaticWebPages |
| Clojure | Cryogen, Perun, Babashka |
| Racket | Frog, Pollen |
| Scala | Laika, ScalaTex |
| OCaml | YOCaml |
| F# | Fornax |
| Kotlin | Orchid |
| Swift | Publish |
| Crystal | Marmot |
| Nim | Nimrod |
| D | Reggae |
| Tcl | Wub |
| Erlang | Zotonic |
| Common Lisp | Coleslaw |

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to participate in development.

---

## Updates

This roadmap is updated as milestones are completed. Check [STATE.scm](STATE.scm) for detailed progress tracking.

Last updated: 2025-12-17
