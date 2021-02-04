require 'bundler/setup'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'https://lennardtimm.de'
SitemapGenerator::Sitemap.public_path = 'build/'

SitemapGenerator::Sitemap.create do
  add '/datenschutz', changefreq: 'monthly'
  add '/impressum', changefreq: 'monthly'

  add '/en', changefreq: 'always'
  add '/en/privacy-policy', changefreq: 'monthly'

  add '/playbook', changefreq: 'weekly'
end

SitemapGenerator::Sitemap.ping_search_engines
