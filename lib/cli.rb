#!/usr/bin/env ruby
# coding: UTF-8

require "thor"

module NATOPhone
  class NATOPhoneCLI < Thor

    desc "encode WORD(S)", "Encode to NATO alphabet"
    map "-E" => "encode"
    option :yell, aliases: '-Y', type: :boolean, desc: "Option to YELL the translation"
    option :json, aliases: '-J', type: :boolean, desc: "Option to export the translation in JSON"
    def encode(*args)
      enc = NATOPhone::Encoder.new(args)
      if options[:yell]
        puts "\n#{enc.yell}\n\n"
      elsif options[:json]
        puts enc.to_json
      else
        puts "\n#{enc.translate}\n\n"
      end
    end

    desc "decode NATO", "Decode from NATO alphabet"
    map "-D" => "decode"
    option :yell, aliases: '-Y', type: :boolean, desc: "Option to YELL the translation"
    option :json, aliases: '-J', type: :boolean, desc: "Option to export the translation in JSON"
    def decode(*args)
      dec = NATOPhone::Decoder.new(args)
      if options[:yell]
        puts "\n#{dec.yell}\n\n"
      elsif options[:json]
        puts dec.to_json
      else
        puts "\n#{dec.translate}\n\n"
      end
    end

  end
end
