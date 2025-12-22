;;; PLAYBOOK.scm — divisionone-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define-module (divisionone-ssg playbook)
  #:export (workflows runbooks operations automations))

;;; =============================================================================
;;; PLAYBOOK — Operational Runbooks for Division One SSG
;;; =============================================================================

(define workflows
  '((development
      (name . "Development Workflow")
      (steps
        ((step . 1) (action . "Setup environment") (command . "just setup"))
        ((step . 2) (action . "Run linter") (command . "just lint"))
        ((step . 3) (action . "Run tests") (command . "just test"))
        ((step . 4) (action . "Build adapters") (command . "just build"))
        ((step . 5) (action . "Verify all") (command . "just check"))))

    (release
      (name . "Release Workflow")
      (steps
        ((step . 1) (action . "Run full test suite") (command . "just test-all"))
        ((step . 2) (action . "Security scan") (command . "just security"))
        ((step . 3) (action . "Update version") (command . "just version-bump"))
        ((step . 4) (action . "Generate changelog") (command . "just changelog"))
        ((step . 5) (action . "Create release") (command . "just release"))))

    (adapter-sync
      (name . "Adapter Synchronization")
      (source . "poly-ssg-mcp")
      (steps
        ((step . 1) (action . "Fetch from hub") (command . "just sync-adapters"))
        ((step . 2) (action . "Validate adapters") (command . "just validate-adapters"))
        ((step . 3) (action . "Run adapter tests") (command . "just test-adapters"))
        ((step . 4) (action . "Commit changes") (command . "git add adapters/ && git commit")))))))

(define runbooks
  '((new-adapter
      (name . "Adding a New SSG Adapter")
      (prerequisites
        ("SSG binary installed"
         "Deno runtime available"
         "Understanding of MCP protocol"))
      (steps
        ((step . 1)
         (action . "Create adapter file")
         (template . "adapters/template.js")
         (output . "adapters/{ssg-name}.js"))
        ((step . 2)
         (action . "Implement required exports")
         (exports . ("name" "language" "description" "connect" "disconnect" "isConnected" "tools")))
        ((step . 3)
         (action . "Define tool schemas")
         (tools . ("init" "build" "serve" "clean" "version")))
        ((step . 4)
         (action . "Add SPDX headers")
         (license . "MIT"))
        ((step . 5)
         (action . "Test adapter")
         (command . "deno test adapters/{ssg-name}.test.js"))
        ((step . 6)
         (action . "Update documentation")
         (files . ("README.adoc" "adapters/README.md")))))

    (security-incident
      (name . "Security Incident Response")
      (severity-levels . ("critical" "high" "medium" "low"))
      (steps
        ((step . 1) (action . "Assess severity") (sla . "1 hour"))
        ((step . 2) (action . "Isolate affected code") (sla . "4 hours"))
        ((step . 3) (action . "Develop fix") (sla . "48 hours"))
        ((step . 4) (action . "Review and test") (sla . "24 hours"))
        ((step . 5) (action . "Deploy fix") (sla . "4 hours"))
        ((step . 6) (action . "Post-mortem") (sla . "1 week"))))

    (dependency-update
      (name . "Dependency Update Process")
      (frequency . "weekly")
      (automation . "dependabot")
      (steps
        ((step . 1) (action . "Review Dependabot PRs"))
        ((step . 2) (action . "Check breaking changes"))
        ((step . 3) (action . "Run full test suite"))
        ((step . 4) (action . "Merge if passing"))
        ((step . 5) (action . "Monitor for regressions"))))))

(define operations
  '((adapters
      (list-all
        (command . "just list-adapters")
        (output . "28 SSG adapters across 17 languages"))
      (validate
        (command . "just validate-adapters")
        (checks . ("SPDX headers" "Export structure" "Tool schemas")))
      (test
        (command . "just test-adapters")
        (coverage-target . 70)))

    (documentation
      (build
        (command . "just docs")
        (formats . ("html" "pdf")))
      (serve
        (command . "just docs-serve")
        (port . 8000))
      (validate
        (command . "just docs-check")
        (checks . ("broken links" "missing refs"))))

    (security
      (scan
        (command . "just security")
        (tools . ("CodeQL" "deno lint")))
      (audit
        (command . "just audit")
        (output . "security-audit.json"))
      (report
        (command . "just security-report")
        (format . "sarif")))))

(define automations
  '((ci-cd
      (triggers . ("push" "pull_request" "schedule"))
      (jobs
        ((lint (runs-on . "ubuntu-latest") (steps . ("checkout" "setup-deno" "deno lint")))
         (test (runs-on . "ubuntu-latest") (steps . ("checkout" "setup-deno" "deno test")))
         (security (runs-on . "ubuntu-latest") (steps . ("checkout" "codeql-init" "codeql-analyze"))))))

    (scheduled
      ((cron . "0 0 * * 0") (action . "weekly-security-scan"))
      ((cron . "0 6 * * 1") (action . "dependency-check"))
      ((cron . "0 0 1 * *") (action . "monthly-audit")))

    (hooks
      (pre-commit
        (actions . ("lint" "format-check" "test-quick")))
      (pre-push
        (actions . ("test-full" "security-quick")))
      (post-merge
        (actions . ("sync-adapters" "update-docs"))))))

;;; =============================================================================
;;; CLI Command Reference
;;; =============================================================================

(define cli-commands
  '((just
      (setup . "Initialize development environment")
      (build . "Build all adapters")
      (test . "Run test suite")
      (test-all . "Run all tests including e2e")
      (lint . "Run linter")
      (fmt . "Format code")
      (check . "Run all checks")
      (security . "Run security scan")
      (docs . "Build documentation")
      (release . "Create release")
      (clean . "Clean build artifacts")
      (list-adapters . "List all SSG adapters")
      (validate-adapters . "Validate adapter structure")
      (sync-adapters . "Sync from poly-ssg-mcp hub"))

    (deno
      (lint . "deno lint adapters/")
      (fmt . "deno fmt adapters/")
      (test . "deno test")
      (run . "deno run --allow-run adapter.js"))))
