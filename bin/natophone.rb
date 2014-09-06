#!/usr/bin/env ruby
# coding: UTF-8

require_relative "../lib/version"
require_relative '../lib/app'


# init NATOPhone with a String or an Array

# otan = if ARGV.empty?
  # NATOPhone.new('Welcome to the NATOPhone translator.')
# else
  # NATOPhone.new(ARGV)
# end

otan = NATOPhone::Encoder.new(ARGV)
puts otan.inspect
