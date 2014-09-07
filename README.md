![travis](https://travis-ci.org/ericdke/NATOPhone.svg?branch=master)

[![Coverage Status](https://img.shields.io/coveralls/ericdke/NATOPhone.svg)](https://coveralls.io/r/ericdke/NATOPhone?branch=master)

# NATOPhone

Simple tool to encode/decode [NATO alphabet](https://en.wikipedia.org/wiki/NATO_phonetic_alphabet).

## Installation

### CLI

```raw
gem install natophone
```  

### Library

Add this line to your application's Gemfile:

```ruby
gem 'natophone'
```

And then execute:

`bundle`

## Usage

### CLI

```raw
natophone encode Hello world.
natophone -E Hello world.
natophone -E 'Hello world.' 'Goodbye!'
natophone -E --yell Hello world.
natophone -E --json Hello world.
natophone decode hotel echo lima lima oscar - whiskey oscar romeo lima delta stop
natophone -D hotel echo lima lima oscar - whiskey oscar romeo lima delta stop
natophone -D 'hotel echo lima lima oscar' 'whiskey oscar romeo lima delta stop'
natophone -D --yell hotel echo lima lima oscar
natophone -D --json hotel echo lima lima oscar
```  

### Library

```ruby
require 'natophone'
```  

```ruby
enc_by_string = NATOPhone::Encoder.new('hello world')
enc_by_array = NATOPhone::Encoder.new(['hello', 'world'])
```  

```ruby
dec_by_string = NATOPhone::Decoder.new('hotel echo lima lima oscar - whiskey oscar romeo lima delta')
dec_by_array = NATOPhone::Decoder.new(%w{hotel echo lima lima oscar - whiskey oscar romeo lima delta})
```  
