#!/usr/bin/env ruby
# encoding: utf-8

module NATOPhone

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
      otan_alphabet_encode.invert
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

    private

    def convert(input)
      input = input.join(' ') if input.is_a?(Array)
      characters = sanitize(input).downcase.chars
      res = characters.map {|char| @dic[char]}.compact
      uniq_separator(res)
    end

    def uniq_separator(input)
      bucket = []
      input.each do |c|
        bucket << c unless bucket.last == '-' && c == '-'
      end
      bucket
    end

  end # End of class Encoder



end # End of module NATOPhone
