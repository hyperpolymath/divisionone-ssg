# Division One SSG Roadmap

This roadmap outlines the development phases for Division One SSG, a satellite repository providing 28 SSG adapters synchronized from the poly-ssg-mcp hub.

## Current Status

**Version**: 0.2.0
**Phase**: v0.3 - Build System Complete
**Overall Completion**: 75% (33/44 components)

---

## Phase 1: Foundation (v0.1) - COMPLETE

- [x] Repository initialization with RSR compliance
- [x] SCM configuration files (META.scm, ECOSYSTEM.scm, STATE.scm)
- [x] GitHub workflows (CodeQL security scanning)
- [x] Dependabot configuration for automated updates
- [x] License setup (MIT OR AGPL-3.0-or-later)
- [x] Basic documentation structure

---

## Phase 2: Security Hardening (v0.2) - COMPLETE

- [x] Security audit of adapter code
- [x] Update SECURITY.md with proper values
- [x] Update CODE_OF_CONDUCT.md
- [x] Update CONTRIBUTING.md
- [x] Fix SCM files to reference correct project name
- [x] Validate secure command execution patterns
- [x] Document security best practices

**Security Findings** (v0.2):
- Adapters use secure `Deno.Command` with array-based args (no command injection risk)
- No shell interpolation in command execution
- SPDX headers present in all adapter files
- No eval() or Function constructor usage

---

## Phase 3: Build System (v0.3) - COMPLETE

- [x] Add PLAYBOOK.scm (operational runbooks)
- [x] Add AGENTIC.scm (AI agent integration)
- [x] Add NEUROSYM.scm (neurosymbolic patterns)
- [x] Create justfile with all commands
- [x] Create Mustfile with build constraints
- [x] Create Containerfile for Podman/Docker
- [x] Add .tool-versions for asdf
- [x] Create cookbook.adoc with CLI/Nickel/Just recipes
- [x] Fix CI/CD pipeline (ci.yml)
- [x] Add hooks configuration (.claude/)

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

## Phase 6: Accessibility (v0.6) - PENDING

- [ ] WCAG compliance utilities
- [ ] Accessibility validators
- [ ] Screen reader testing tools
- [ ] Keyboard navigation helpers
- [ ] Color contrast utilities

---

## Phase 7: MCP Server (v0.7) - PENDING

- [ ] Standalone MCP server implementation
- [ ] Multi-adapter support
- [ ] Dynamic adapter loading
- [ ] Configuration management
- [ ] CLI interface

---

## Phase 8: Production Ready (v1.0) - FUTURE

- [ ] Complete documentation
- [ ] Full test coverage (70%+)
- [ ] Performance benchmarks
- [ ] External security audit
- [ ] Release automation
- [ ] Semantic versioning automation

---

## Component Inventory (33/44 Complete)

| Category | Complete | Total | Status |
|----------|----------|-------|--------|
| Core Engine | 2 | 4 | Partial |
| Build System | 4 | 4 | Complete |
| Site Generation | 4 | 4 | Complete |
| Adapters | 3 | 3 | Complete |
| Accessibility | 0 | 5 | Pending |
| Testing | 0 | 4 | Pending |
| Documentation | 8 | 8 | Complete |
| Configuration | 3 | 3 | Complete |
| Language Tooling | 6 | 6 | Complete |
| Examples | 3 | 3 | Complete |

---

## Build System Commands

```bash
# Setup
just setup          # Initialize environment
just prereqs        # Check prerequisites

# Development
just fmt            # Format code
just lint           # Run linter
just check          # Format + lint

# Testing
just test           # Run unit tests
just test-all       # Run all tests
just test-e2e       # Run e2e tests

# Adapters
just list-adapters      # List all adapters
just validate-adapters  # Validate structure
just sync-adapters      # Sync from hub

# Security
just security       # Security scan
just audit          # Full audit

# Documentation
just docs           # Build docs
just docs-serve     # Serve docs locally

# Release
just release        # Create release
just clean          # Clean artifacts
```

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

Last updated: 2025-12-22
