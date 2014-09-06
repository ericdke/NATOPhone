require_relative 'spec_helper'
require_relative 'helpers'

describe NATOPhone::Encoder do

  let(:enc) { NATOPhone::Encoder.new('Hello World.') }

  describe "#args" do

    it "shows args" do
      expect(enc.args).to eq 'Hello World.'
    end

    it "shows translation" do
      expect(enc.translate).to eq 'hotel echo lima lima oscar - whiskey oscar romeo lima delta stop'
    end

    it "shows encoded result" do
      expect(enc.encode).to eq ["hotel", "echo", "lima", "lima", "oscar", "-", "whiskey", "oscar", "romeo", "lima", "delta", "stop"]
    end

    it "shows the yell string" do
      expect(enc.yell).to eq 'HOTEL ECHO LIMA LIMA OSCAR - WHISKEY OSCAR ROMEO LIMA DELTA STOP'
    end

  end

end

describe NATOPhone::Decoder do

  let(:dec) { NATOPhone::Decoder.new('hotel echo lima lima oscar - whiskey oscar romeo lima delta stop') }

  describe "#args" do

    it "shows args" do
      expect(dec.args).to eq 'hotel echo lima lima oscar - whiskey oscar romeo lima delta stop'
    end

    it "shows translation" do
      expect(dec.translate).to eq 'hello world.'
    end

    it "shows decoded result" do
      expect(dec.decode).to eq ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d", "."]
    end

    it "shows the yell string" do
      expect(dec.yell).to eq 'HELLO WORLD.'
    end

  end

end

