# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "cytoscape", to: "https://ga.jspm.io/npm:cytoscape@3.26.0/dist/cytoscape.cjs.js"
pin "heap", to: "https://ga.jspm.io/npm:heap@0.2.7/index.js"
pin "lodash/debounce", to: "https://ga.jspm.io/npm:lodash@4.17.21/debounce.js"
pin "lodash/get", to: "https://ga.jspm.io/npm:lodash@4.17.21/get.js"
pin "lodash/set", to: "https://ga.jspm.io/npm:lodash@4.17.21/set.js"
pin "lodash/toPath", to: "https://ga.jspm.io/npm:lodash@4.17.21/toPath.js"
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/process-production.js"
