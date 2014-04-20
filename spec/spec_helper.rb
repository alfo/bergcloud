require 'bundler'
Bundler.setup

require File.join(File.dirname(__FILE__), '/../lib/bergcloud')

API_TOKEN = ENV['BERGCLOUD_TOKEN'] || 'f9fb854c-8d7bda78-59dac7dc-9480fe63'
PROJECT_ID = ENV['PROJECT_ID'] || 'a9c752c8e0f66d2461c47422f7d64bd3'
