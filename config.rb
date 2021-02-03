# frozen_string_literal: true

require 'slim'
Slim::Engine.options[:pretty] = true

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

activate :external_pipeline,
  name: :brunch,
  command: build? ? './node_modules/brunch/bin/brunch build --production --env production' : './node_modules/brunch/bin/brunch watch --stdin',
  source: "tmp/dist",
  latency: 1

activate :directory_indexes

# Helpers
helpers do
  def current_host
    build? ? 'https://lennardtimm.de' : 'https://lennardtimm.development'
  end
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :development do
  activate :dotenv
  activate :livereload
end

configure :build do
  activate :asset_hash
  activate :minify_css
  activate :minify_javascript
end
