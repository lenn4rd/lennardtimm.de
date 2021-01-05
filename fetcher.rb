#!/usr/bin/env ruby

require 'bundler/setup'
require 'dotenv/load'

require 'thumbtack'
require 'yaml'

PINBOARD_USERNAME = ENV['PINBOARD_TOKEN'].split(':').first.freeze
PINBOARD_TOKEN = ENV['PINBOARD_TOKEN'].split(':').last.freeze

client = Thumbtack::Client.new(PINBOARD_USERNAME, PINBOARD_TOKEN)

posts = client.posts.recent(tag: ['data-curriculum', 'highlight'], count: 5)

File.open('data/playbook.yml', 'w+') do |file|
  file << YAML.dump(posts)
end
