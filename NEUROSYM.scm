;;; NEUROSYM.scm — divisionone-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define-module (divisionone-ssg neurosym)
  #:export (symbolic-reasoning neural-integration hybrid-patterns knowledge-representation))

;;; =============================================================================
;;; NEUROSYM — Neurosymbolic Integration for Division One SSG
;;; =============================================================================

;;; This file defines the neurosymbolic architecture combining neural AI
;;; capabilities with symbolic reasoning for SSG adapter orchestration.

(define symbolic-reasoning
  '((adapter-taxonomy
      (description . "Hierarchical classification of SSG adapters")
      (hierarchy
        ((root . "static-site-generator")
         (categories
           ((systems-languages
              (description . "SSGs in systems programming languages")
              (members . ("zola" "cobalt" "mdbook"))
              (properties . ("fast-builds" "compiled" "memory-safe")))

            (functional-languages
              (description . "SSGs in functional programming languages")
              (subcategories
                ((ml-family
                   (members . ("hakyll" "ema" "yocaml" "fornax"))
                   (properties . ("type-safe" "pure-functions" "lazy-evaluation")))
                 (lisp-family
                   (members . ("cryogen" "perun" "babashka" "frog" "pollen" "coleslaw"))
                   (properties . ("homoiconic" "macro-powered" "repl-driven")))))

            (beam-languages
              (description . "SSGs on the BEAM VM")
              (members . ("serum" "nimble-publisher" "tableau" "zotonic"))
              (properties . ("concurrent" "fault-tolerant" "hot-reload")))

            (scientific-languages
              (description . "SSGs in scientific computing languages")
              (members . ("franklin" "documenter" "staticwebpages"))
              (properties . ("literate-programming" "notebook-support" "math-rendering")))

            (jvm-languages
              (description . "SSGs on the JVM")
              (members . ("laika" "scalatex" "orchid"))
              (properties . ("ecosystem-rich" "cross-platform" "enterprise-ready"))))))))

    (feature-ontology
      (description . "Semantic features of SSG capabilities")
      (features
        ((content-types
           (markdown . ("zola" "hakyll" "cryogen" "cobalt"))
           (asciidoc . ("zola" "hakyll"))
           (restructured-text . ("documenter" "laika"))
           (org-mode . ("hakyll" "perun"))
           (pollen-markup . ("pollen"))
           (literate . ("franklin" "pollen")))

         (templating
           (mustache . ("cobalt"))
           (tera . ("zola"))
           (jinja2-like . ("serum" "cryogen"))
           (native-dsl . ("hakyll" "pollen" "yocaml")))

         (asset-processing
           (sass-scss . ("zola" "hakyll"))
           (image-optimization . ("zola" "mdbook"))
           (syntax-highlighting . ("zola" "mdbook" "hakyll"))))))

    (inference-rules
      (description . "Logical rules for adapter selection")
      (rules
        ((rule . "fast-static-blog")
         (if . ((need . "blog") (priority . "build-speed")))
         (then . (recommend . ("zola" "cobalt")))
         (confidence . 0.9))

        ((rule . "haskell-expertise")
         (if . ((team-knows . "haskell")))
         (then . (recommend . ("hakyll" "ema")))
         (confidence . 0.95))

        ((rule . "documentation-site")
         (if . ((type . "documentation") (need . "api-docs")))
         (then . (recommend . ("documenter" "mdbook" "orchid")))
         (confidence . 0.85))

        ((rule . "lisp-macro-power")
         (if . ((need . "programmable-markup") (prefer . "lisp")))
         (then . (recommend . ("pollen" "frog")))
         (confidence . 0.9))))))

(define neural-integration
  '((embedding-spaces
      (adapter-embeddings
        (description . "Vector representations of adapters")
        (dimensions . 768)
        (model . "sentence-transformers")
        (similarity-metric . "cosine")
        (use-cases
          ("semantic-search"
           "recommendation"
           "clustering"
           "anomaly-detection")))

      (feature-embeddings
        (description . "Vector representations of features")
        (enables . ("feature-similarity" "capability-matching"))))

    (language-models
      (adapter-understanding
        (task . "Interpret user requirements for SSG selection")
        (input . "natural language description")
        (output . "structured adapter recommendation"))

      (error-analysis
        (task . "Analyze build errors and suggest fixes")
        (input . "error logs and context")
        (output . "actionable remediation steps"))

      (migration-planning
        (task . "Plan content migration between SSGs")
        (input . "source site structure and target SSG")
        (output . "migration strategy with steps")))

    (pattern-recognition
      (build-patterns
        (description . "Learn common build configurations")
        (features . ("build-time" "output-size" "error-frequency")))

      (usage-patterns
        (description . "Track adapter usage for optimization")
        (metrics . ("invocation-count" "success-rate" "common-args"))))))

(define hybrid-patterns
  '((neuro-symbolic-pipeline
      (description . "Combined neural and symbolic processing")
      (stages
        ((stage . 1)
         (type . "neural")
         (action . "embed-user-query")
         (output . "query-vector"))

        ((stage . 2)
         (type . "symbolic")
         (action . "apply-taxonomy-filters")
         (input . "query-vector")
         (output . "candidate-adapters"))

        ((stage . 3)
         (type . "neural")
         (action . "rank-by-relevance")
         (input . "candidate-adapters")
         (output . "ranked-list"))

        ((stage . 4)
         (type . "symbolic")
         (action . "apply-inference-rules")
         (input . "ranked-list")
         (output . "final-recommendation"))))

    (explainable-recommendations
      (description . "Transparent reasoning for adapter selection")
      (components
        ((neural-component
           (provides . "similarity-scores")
           (explains . "why adapters are semantically similar"))

         (symbolic-component
           (provides . "rule-traces")
           (explains . "which rules led to recommendation"))

         (hybrid-explanation
           (format . "structured-natural-language")
           (includes . ("factors" "confidence" "alternatives"))))))

    (adaptive-learning
      (description . "System learns from usage patterns")
      (learning-signals
        ("user-feedback"
         "build-success-rate"
         "feature-usage-frequency"))
      (adaptation-targets
        ("recommendation-weights"
         "rule-confidence"
         "embedding-fine-tuning")))))

(define knowledge-representation
  '((adapter-knowledge-graph
      (nodes
        ((adapters . 28)
         (languages . 17)
         (features . 50)
         (use-cases . 30)))
      (edges
        ((implements (from . "adapter") (to . "feature"))
         (written-in (from . "adapter") (to . "language"))
         (suitable-for (from . "adapter") (to . "use-case"))
         (similar-to (from . "adapter") (to . "adapter"))
         (migrates-to (from . "adapter") (to . "adapter")))))

    (reasoning-capabilities
      (transitive-closure
        (example . "If A similar-to B and B similar-to C, then A somewhat-similar-to C"))
      (constraint-satisfaction
        (example . "Find adapter matching: fast builds AND markdown AND syntax highlighting"))
      (analogical-reasoning
        (example . "Zola is to Rust as Hakyll is to ?")))

    (knowledge-evolution
      (sources
        ("adapter-changelogs"
         "community-feedback"
         "benchmark-results"
         "ecosystem-changes"))
      (update-triggers
        ("new-adapter-release"
         "feature-deprecation"
         "performance-regression")))))

;;; =============================================================================
;;; Integration Points
;;; =============================================================================

(define integration-points
  '((with-mcp
      (description . "MCP tools enhanced with neurosymbolic reasoning")
      (enhancements
        ((tool . "list_adapters")
         (enhancement . "semantic-filtering"))
        ((tool . "choose_ssg")
         (enhancement . "hybrid-recommendation"))
        ((tool . "migrate_site")
         (enhancement . "intelligent-mapping"))))

    (with-agentic
      (description . "Agent patterns using neurosymbolic capabilities")
      (patterns
        ((pattern . "ssg-advisor")
         (capability . "explainable-recommendations"))
        ((pattern . "migration-assistant")
         (capability . "knowledge-graph-traversal"))
        ((pattern . "multi-ssg-coordinator")
         (capability . "constraint-satisfaction"))))

    (with-playbook
      (description . "Runbooks enhanced with learned patterns")
      (enhancements
        ((runbook . "new-adapter")
         (enhancement . "template-suggestion"))
        ((runbook . "security-incident")
         (enhancement . "pattern-based-triage"))))))
