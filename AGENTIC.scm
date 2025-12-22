;;; AGENTIC.scm — divisionone-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define-module (divisionone-ssg agentic)
  #:export (agent-capabilities mcp-integration tool-definitions agent-patterns))

;;; =============================================================================
;;; AGENTIC — AI Agent Integration for Division One SSG
;;; =============================================================================

;;; This file defines how AI agents (Claude, GPT, etc.) can interact with
;;; the SSG adapter collection via MCP (Model Context Protocol).

(define agent-capabilities
  '((primary-function . "SSG adapter orchestration via MCP")
    (supported-models . ("claude" "gpt-4" "gemini" "local-llm"))

    (capabilities
      ((name . "adapter-discovery")
       (description . "Discover and list available SSG adapters")
       (tools . ("list_adapters" "get_adapter_info" "search_adapters")))

      ((name . "site-generation")
       (description . "Build and manage static sites")
       (tools . ("init_site" "build_site" "serve_site" "deploy_site")))

      ((name . "multi-ssg-orchestration")
       (description . "Coordinate multiple SSGs for complex workflows")
       (tools . ("parallel_build" "pipeline_execute" "migrate_site")))

      ((name . "adapter-management")
       (description . "Manage adapter lifecycle")
       (tools . ("connect_adapter" "disconnect_adapter" "adapter_health"))))))

(define mcp-integration
  '((protocol-version . "2024-11-05")
    (transport . ("stdio" "http" "websocket"))

    (server-config
      (name . "divisionone-ssg")
      (version . "0.1.0")
      (capabilities
        (tools . #t)
        (resources . #t)
        (prompts . #t)))

    (resource-types
      ((type . "adapter")
       (uri-pattern . "ssg://adapters/{name}")
       (mime-type . "application/json")
       (description . "SSG adapter resource"))

      ((type . "site")
       (uri-pattern . "ssg://sites/{path}")
       (mime-type . "text/html")
       (description . "Generated site content"))

      ((type . "config")
       (uri-pattern . "ssg://config/{adapter}")
       (mime-type . "application/json")
       (description . "Adapter configuration")))

    (prompts
      ((name . "build-site")
       (description . "Guide for building a static site")
       (arguments . (("ssg" . "SSG to use") ("path" . "Site path"))))

      ((name . "choose-ssg")
       (description . "Help user choose appropriate SSG")
       (arguments . (("language" . "Preferred language") ("features" . "Required features"))))

      ((name . "migrate-site")
       (description . "Migrate site between SSGs")
       (arguments . (("from" . "Source SSG") ("to" . "Target SSG")))))))

(define tool-definitions
  '((adapter-tools
      ;; Discovery tools
      ((name . "list_adapters")
       (description . "List all available SSG adapters")
       (inputSchema
         (type . "object")
         (properties
           (language (type . "string") (description . "Filter by programming language"))
           (feature (type . "string") (description . "Filter by feature support")))
         (required . ())))

      ((name . "get_adapter_info")
       (description . "Get detailed information about an adapter")
       (inputSchema
         (type . "object")
         (properties
           (name (type . "string") (description . "Adapter name")))
         (required . ("name"))))

      ;; Connection tools
      ((name . "connect_adapter")
       (description . "Connect to an SSG adapter")
       (inputSchema
         (type . "object")
         (properties
           (adapter (type . "string") (description . "Adapter name"))
           (options (type . "object") (description . "Connection options")))
         (required . ("adapter"))))

      ((name . "disconnect_adapter")
       (description . "Disconnect from an SSG adapter")
       (inputSchema
         (type . "object")
         (properties
           (adapter (type . "string") (description . "Adapter name")))
         (required . ("adapter"))))

      ;; Site generation tools
      ((name . "init_site")
       (description . "Initialize a new site with specified SSG")
       (inputSchema
         (type . "object")
         (properties
           (adapter (type . "string") (description . "SSG adapter to use"))
           (path (type . "string") (description . "Site directory path"))
           (template (type . "string") (description . "Site template")))
         (required . ("adapter" "path"))))

      ((name . "build_site")
       (description . "Build a static site")
       (inputSchema
         (type . "object")
         (properties
           (adapter (type . "string") (description . "SSG adapter"))
           (path (type . "string") (description . "Site directory"))
           (options (type . "object") (description . "Build options")))
         (required . ("adapter" "path"))))

      ((name . "serve_site")
       (description . "Start development server")
       (inputSchema
         (type . "object")
         (properties
           (adapter (type . "string") (description . "SSG adapter"))
           (path (type . "string") (description . "Site directory"))
           (port (type . "number") (description . "Server port")))
         (required . ("adapter" "path"))))

      ;; Orchestration tools
      ((name . "parallel_build")
       (description . "Build multiple sites in parallel")
       (inputSchema
         (type . "object")
         (properties
           (sites (type . "array")
                  (items (type . "object")
                         (properties
                           (adapter (type . "string"))
                           (path (type . "string"))))))
         (required . ("sites"))))

      ((name . "pipeline_execute")
       (description . "Execute a build pipeline")
       (inputSchema
         (type . "object")
         (properties
           (steps (type . "array") (description . "Pipeline steps"))
           (parallel (type . "boolean") (description . "Run steps in parallel")))
         (required . ("steps")))))))

(define agent-patterns
  '((autonomous-site-builder
      (description . "Agent that can independently build and deploy sites")
      (workflow
        ((step . 1) (action . "analyze-requirements") (tools . ("choose-ssg")))
        ((step . 2) (action . "initialize-site") (tools . ("init_site")))
        ((step . 3) (action . "configure-site") (tools . ("update_config")))
        ((step . 4) (action . "build-site") (tools . ("build_site")))
        ((step . 5) (action . "verify-output") (tools . ("check_site")))
        ((step . 6) (action . "deploy") (tools . ("deploy_site")))))

    (multi-ssg-coordinator
      (description . "Coordinates multiple SSGs for polyglot projects")
      (capabilities
        ("parallel-builds"
         "cross-ssg-linking"
         "unified-output"
         "incremental-updates"))
      (use-cases
        ("documentation-sites"
         "multi-language-blogs"
         "component-libraries")))

    (migration-assistant
      (description . "Helps migrate sites between SSG platforms")
      (workflow
        ((step . 1) (action . "analyze-source") (extract . ("content" "config" "templates")))
        ((step . 2) (action . "map-features") (match . "source-to-target"))
        ((step . 3) (action . "transform-content") (preserve . ("frontmatter" "assets")))
        ((step . 4) (action . "generate-config") (target . "new-ssg"))
        ((step . 5) (action . "validate-migration") (check . ("links" "assets" "structure")))))

    (ssg-advisor
      (description . "Recommends appropriate SSG based on requirements")
      (factors
        ("preferred-language"
         "team-expertise"
         "performance-needs"
         "feature-requirements"
         "ecosystem-compatibility"))
      (recommendations
        ((fast-builds . ("zola" "hugo" "mdbook"))
         (blog-focused . ("hakyll" "cryogen" "serum"))
         (documentation . ("documenter" "mdbook" "orchid"))
         (programmatic . ("pollen" "franklin" "fornax")))))))

;;; =============================================================================
;;; Claude Code Integration
;;; =============================================================================

(define claude-code-integration
  '((hooks
      (session-start
        (action . "load-adapter-context")
        (provides . ("adapter-list" "tool-schemas" "usage-examples")))

      (tool-call
        (pre-hook . "validate-adapter-state")
        (post-hook . "update-session-context"))

      (error-handling
        (adapter-not-found . "suggest-similar")
        (connection-failed . "retry-with-backoff")
        (build-failed . "analyze-and-suggest")))

    (context-management
      (adapter-state . "track-connected-adapters")
      (build-history . "maintain-recent-builds")
      (error-context . "preserve-for-debugging"))

    (prompt-engineering
      (system-context . "SSG adapter orchestration specialist")
      (capabilities-summary . "28 SSG adapters across 17 languages")
      (response-format . "structured with code examples"))))
