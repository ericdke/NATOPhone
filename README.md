# NatoPhone

Simple tool to encode/decode [NATO alphabet](https://en.wikipedia.org/wiki/NATO_phonetic_alphabet).

## Installation

### CLI

    $ gem install natophone

### Library

Add this line to your application's Gemfile:

```ruby
gem 'natophone'
```

And then execute:

    $ bundle

## Usage

### CLI

    $ natophone encode Hello world.

    $ natophone encode --yell Hello world.

    $ natophone encode --json Hello world.

    $ natophone decode hotel echo lima lima oscar - whiskey oscar romeo lima delta stop

    $ natophone decode --yell hotel echo lima lima oscar - whiskey oscar romeo lima delta stop

    $ natophone decode --json hotel echo lima lima oscar - whiskey oscar romeo lima delta stop

### Library

```ruby
enc = NatoPhone::Encoder.new(args)
puts enc.inspect
```  

```ruby
dec = NatoPhone::Decoder.new(args)
puts dec.inspect
```  
