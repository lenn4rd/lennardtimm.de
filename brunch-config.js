exports.config = {
    overrides: {
        production: {
            paths: {
                public: "build"
            }
        }
    },
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: "javascripts/site.js"
    },
    stylesheets: {
      joinTo: "stylesheets/site.css",
      order: {
        after: ["source/stylesheets/site.css.scss"] // concat app.css last
      }
    },
    templates: {
      joinTo: "javascripts/site.js"
    }
  },

  conventions: {
    assets: /^(source\/images)/
  },

  paths: {
    // Dependencies and current project directories to watch
    watched: [
      "source/javascripts",
      "source/stylesheets",
      "source/images",
      "test/static"
    ],

    // Where to compile files to
    public: "tmp/dist"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/source\/vendor/],
        presets: ['@babel/preset-env']
    },
    sass: {
      debug: 'comments',
      options: {
        precision: 8 // minimum precision required by bootstrap-sass
      }
    },
  },

  modules: {
    autoRequire: {
      "javascripts/site.js": ["source/javascripts/site"]
    }
  },
  npm: {
    enabled: true,
    globals: {
      Cookies: 'js-cookie'
      // $: 'jquery',
      // jQuery: 'jquery'
    }
  }
};
