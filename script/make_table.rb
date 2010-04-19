#!/usr/bin/ruby
require 'rubygems'
require "dm-core"
require "dm-timestamps"
require "yaml"

env = ENV["PIKI_ENV"] || "development"
config = YAML::load_file("config/app/#{env}/app.yaml")["dsn"]

class Page
  include DataMapper::Resource

  property :id,      Serial
  property :name,    String, :required => true, :default => '', :length => 0..255
  property :content, Text,   :required => true, :default => ''
  timestamps :at
end

class Account
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String, :required => true, :default => '', :length => 0..255
  property :password, String, :required => true, :default => '', :length => 0..255
  timestamps :at
end

DataMapper.setup(:default, {
  :adapter  => config["adaptor"],
  :database => config["database"],
  :username => config["username"],
  :password => config["password"],
  :host     => config["host"]
})

DataMapper.auto_migrate!
