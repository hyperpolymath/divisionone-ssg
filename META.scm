;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; META.scm — divisionone-ssg

(define-module (divisionone-ssg meta)
  #:export (architecture-decisions development-practices design-rationale))

(define architecture-decisions
  '((adr-001
     (title . "RSR Compliance")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Project in the hyperpolymath ecosystem")
     (decision . "Follow Rhodium Standard Repository guidelines")
     (consequences . ("RSR Gold target" "SHA-pinned actions" "SPDX headers" "Multi-platform CI")))

    (adr-002
     (title . "Deno Runtime")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Need secure runtime for SSG adapters")
     (decision . "Use Deno for all adapter implementations")
     (consequences . ("Secure by default" "TypeScript support" "No npm dependency hell" "Built-in tooling")))

    (adr-003
     (title . "MCP Protocol")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Need standardized interface for AI agents")
     (decision . "Implement Model Context Protocol for all adapters")
     (consequences . ("Claude integration" "Standardized tools" "Resource discovery" "Prompt templates")))

    (adr-004
     (title . "Satellite Architecture")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Relationship with poly-ssg-mcp hub")
     (decision . "Operate as satellite receiving adapter sync from hub")
     (consequences . ("Reduced maintenance" "Consistency across satellites" "Hub as source of truth")))

    (adr-005
     (title . "Build System")
     (status . "accepted")
     (date . "2025-12-22")
     (context . "Need reproducible builds and task automation")
     (decision . "Use Just for task running with Mustfile for constraints")
     (consequences . ("Portable recipes" "Declarative constraints" "CI/CD integration")))))

(define development-practices
  '((code-style (languages . ("javascript" "typescript")) (formatter . "deno fmt") (linter . "deno lint"))
    (security (sast . "CodeQL") (credentials . "env vars only"))
    (testing (coverage-minimum . 70))
    (versioning (scheme . "SemVer 2.0.0"))))

(define design-rationale
  '((why-rsr "RSR ensures consistency, security, and maintainability across the hyperpolymath ecosystem.")
    (why-deno "Deno provides secure-by-default execution with built-in TypeScript and modern tooling.")
    (why-mcp "MCP enables seamless integration with AI assistants like Claude for automated site generation.")
    (why-satellite "Satellite architecture allows focused implementations while hub manages shared adapter code.")
    (why-scheme-scm "Scheme-based SCM files provide homoiconic configuration that can be programmatically processed.")))

(define build-system
  '((task-runner . "just")
    (constraints . "Mustfile")
    (container . "Containerfile (Podman/Docker)")
    (version-manager . "asdf (.tool-versions)")

    (commands
      ((just
         (default . "check")
         (setup . "Initialize environment")
         (fmt . "Format code")
         (lint . "Run linter")
         (test . "Run tests")
         (check . "fmt + lint")
         (security . "Security scan")
         (docs . "Build documentation")
         (release . "Create release"))))))
