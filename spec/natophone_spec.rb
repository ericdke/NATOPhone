require_relative 'spec_helper'
require_relative 'helpers'

describe NATOPhone::Encoder do

  let(:enc) { NATOPhone::Encoder.new('1.0 Hello World.') }

  describe "#args" do

    it "shows args" do
      expect(enc.args).to eq '1.0 Hello World.'
    end

    it "shows translation" do
      expect(enc.translate).to eq 'one stop zero - hotel echo lima lima oscar - whiskey oscar romeo lima delta stop'
    end

    it "shows encoded result" do
      expect(enc.encode).to eq ["one", "stop", "zero", "-", "hotel", "echo", "lima", "lima", "oscar", "-", "whiskey", "oscar", "romeo", "lima", "delta", "stop"]
    end

    it "shows the yell string" do
      expect(enc.yell).to eq 'ONE STOP ZERO - HOTEL ECHO LIMA LIMA OSCAR - WHISKEY OSCAR ROMEO LIMA DELTA STOP'
    end

  end

end

describe NATOPhone::Decoder do

  let(:dec) { NATOPhone::Decoder.new('one point zero - hotel echo lima lima oscar - whiskey oscar romeo lima delta stop') }

  describe "#args" do

    it "shows args" do
      expect(dec.args).to eq 'one point zero - hotel echo lima lima oscar - whiskey oscar romeo lima delta stop'
    end

    it "shows translation" do
      expect(dec.translate).to eq '1.0 hello world.'
    end

    it "shows decoded result" do
      expect(dec.decode).to eq ["1", ".", "0", " ", "h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d", "."]
    end

    it "shows the yell string" do
      expect(dec.yell).to eq '1.0 HELLO WORLD.'
    end

  end

end

