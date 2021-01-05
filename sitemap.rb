require 'bundler/setup'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'https://lennardtimm.de'
SitemapGenerator::Sitemap.public_path = 'build/'

SitemapGenerator::Sitemap.create do
  add '/impressum', changefreq: 'monthly'
  add '/playbook', changefreq: 'weekly'
  add '/privacy-policy', changefreq: 'monthly'
end

SitemapGenerator::Sitemap.ping_search_engines
