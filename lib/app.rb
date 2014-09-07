#!/usr/bin/env ruby
# encoding: utf-8

module NATOPhone

  require 'json'

  class Base

    attr_accessor :args, :translate, :yell

    def initialize(args)
      @args = args
    end

    private

    def otan_alphabet_encode
      { "a" => "alpha", "b" => "bravo", "c" => "charlie", "d" => "delta", "e" => "echo", "f" => "foxtrot", "g" => "golf", "h" => "hotel", "i" => "india", "j" => "juliet", "k" => "kilo", "l" => "lima", "m" => "mike", "n" => "november", "o" => "oscar", "p" => "papa", "q" => "quebec", "r" => "romeo", "s" => "sierra", "t" => "tango", "u" => "uniform", "v" => "victor", "w" => "whiskey", "x" => "x-ray", "y" => "yankee", "z" => "zulu", "0" => "zero", "1" => "one", "2" => "two", "3" => "three", "4" => "four", "5" => "five", "6" => "six", "7" => "seven", "8" => "eight", "9" => "niner", " " => "-", "." => "stop" }
    end

    def otan_alphabet_decode
      otan = otan_alphabet_encode.invert
      otan.merge!({"point" => "."})
    end

    def sanitize(string)
      string.tr "ÀÁÂÃÄÅàáâãäåĀāĂăĄąÇçĆćĈĉĊċČčÐðĎďĐđÈÉÊËèéêëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħÌÍÎÏìíîïĨĩĪīĬĭĮįİıĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅņŇňŉŊŋÒÓÔÕÖØòóôõöøŌōŎŏŐőŔŕŖŗŘřŚśŜŝŞşŠšſŢţŤťŦŧÙÚÛÜùúûüŨũŪūŬŭŮůŰűŲųŴŵÝýÿŶŷŸŹźŻżŽž", "AAAAAAaaaaaaAaAaAaCcCcCcCcCcDdDdDdEEEEeeeeEeEeEeEeEeGgGgGgGgHhHhIIIIiiiiIiIiIiIiIiJjKkkLlLlLlLlLlNnNnNnNnnNnOOOOOOooooooOoOoOoRrRrRrSsSsSsSssTtTtTtUUUUuuuuUuUuUuUuUuUuWwYyyYyYZzZzZz"
    end

  end # End of class Base

  class Encoder < Base

    attr_accessor :encode

    def initialize(args)
      super(args)
      @dic = otan_alphabet_encode()
      @encode = convert(args)
      @translate = @encode.join(' ')
      @yell = @translate.upcase
    end

    def to_json
      {
        'args' => @args,
        'encode' => @encode,
        'translate' => @translate,
        'yell' => @yell
      }.to_json
    end

    def to_s
      @translate
    end

    def to_a
      @encode
    end

    private

    def convert(input)
      input = check_input(input)
      characters = sanitize(input).downcase.chars
      res = characters.map {|char| @dic[char]}.compact
      uniq_separator(res)
    end

    def check_input(input)
      if input.is_a?(String)
        return input
      elsif input.is_a?(Array)
        return input.join(' ')
      else
        raise TypeError, "Error: Encoder accepts only Strings or Arrays."
      end
    end

    def uniq_separator(input)
      bucket = []
      input.each do |c|
        bucket << c unless bucket.last == '-' && c == '-'
      end
      bucket
    end

  end # End of class Encoder

  class Decoder < Base

    attr_accessor :decode

    def initialize(args)
      super(args)
      @dic = otan_alphabet_decode()
      @decode = convert(args)
      @translate = @decode.join()
      @yell = @translate.upcase
    end

    def to_json
      {
        'args' => @args,
        'decode' => @decode,
        'translate' => @translate,
        'yell' => @yell
      }.to_json
    end

    def to_s
      @translate
    end

    def to_a
      @decode
    end

    private

    def convert(args)
      words = if args.is_a?(String)
        convert_string(args)
      elsif args.is_a?(Array)
        convert_array(args)
      else
        raise TypeError, "Error: Decoder accepts only Strings or Arrays."
      end
      words.map {|word| @dic[word]}
    end

    def convert_string args
      args.split(' ').map {|word| word}
    end

    def convert_array args
      words = []
      args.each do |string|
        string.split(' ').each do |word|
          words << word
        end
      end
      return words
    end

  end # End of class Decoder

end # End of module NATOPhone
