;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — divisionone-ssg

(ecosystem
  (version "1.0.0")
  (name "divisionone-ssg")
  (type "satellite")
  (purpose "Unified SSG adapter collection - satellite of poly-ssg-mcp hub")

  (position-in-ecosystem
    "Satellite SSG implementation. Receives adapter updates from poly-ssg-mcp hub. Provides standalone access to 28 SSG adapters via MCP.")

  (related-projects
    (project
      (name "poly-ssg-mcp")
      (url "https://github.com/hyperpolymath/poly-ssg-mcp")
      (relationship "hub")
      (description "Unified MCP server for 28 SSGs - provides adapter interface")
      (sync-mechanism "transfer-ssg-adapters.sh")
      (differentiation
        "poly-ssg-mcp = Hub with all SSG adapters via MCP
         This project = Satellite SSG implementation using the hub"))
    (project
      (name "rhodium-standard-repositories")
      (url "https://github.com/hyperpolymath/rhodium-standard-repositories")
      (relationship "standard")
      (description "Repository guidelines and templates")))

  (adapters
    (count . 28)
    (languages . 17)
    (by-language
      ((rust . ("zola" "cobalt" "mdbook"))
       (haskell . ("hakyll" "ema"))
       (elixir . ("serum" "nimble-publisher" "tableau"))
       (julia . ("franklin" "documenter" "staticwebpages"))
       (clojure . ("cryogen" "perun" "babashka"))
       (racket . ("frog" "pollen"))
       (scala . ("laika" "scalatex"))
       (ocaml . ("yocaml"))
       (fsharp . ("fornax"))
       (kotlin . ("orchid"))
       (swift . ("publish"))
       (crystal . ("marmot"))
       (nim . ("nimrod"))
       (d . ("reggae"))
       (tcl . ("wub"))
       (erlang . ("zotonic"))
       (common-lisp . ("coleslaw")))))

  (integration
    (mcp-protocol . "2024-11-05")
    (ai-assistants . ("claude" "gpt-4" "gemini"))
    (tool-categories . ("init" "build" "serve" "check" "version")))

  (what-this-is
    "Satellite repository providing 28 SSG adapters synchronized from poly-ssg-mcp hub.
     Enables AI agents to orchestrate static site generation across multiple languages.")

  (what-this-is "Satellite repository providing 28 SSG adapters synchronized from poly-ssg-mcp hub")
  (what-this-is-not "- NOT the hub (poly-ssg-mcp is the hub)
                     - NOT a standalone SSG itself
                     - NOT exempt from RSR compliance"))
