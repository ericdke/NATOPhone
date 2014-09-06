require_relative 'spec_helper'
require_relative 'helpers'

describe NATOPhone::Encoder do

  let(:enc) { NATOPhone::Encoder.new('1.0 Hello World.') }

  describe "#args" do
    it "shows args" do
      expect(enc.args).to eq '1.0 Hello World.'
    end
  end

  describe "#translate" do
    it "shows translation" do
      expect(enc.translate).to eq 'one stop zero - hotel echo lima lima oscar - whiskey oscar romeo lima delta stop'
    end
  end

  describe "#encode" do
    it "shows encoded result" do
      expect(enc.encode).to eq ["one", "stop", "zero", "-", "hotel", "echo", "lima", "lima", "oscar", "-", "whiskey", "oscar", "romeo", "lima", "delta", "stop"]
    end
  end

  describe "#yell" do
    it "shows the yell string" do
      expect(enc.yell).to eq 'ONE STOP ZERO - HOTEL ECHO LIMA LIMA OSCAR - WHISKEY OSCAR ROMEO LIMA DELTA STOP'
    end
  end

  describe "#to_json" do
    it "outputs json" do
      j = JSON.parse(enc.to_json)
      expect(j['args']).to eq '1.0 Hello World.'
      expect(j['translate']).to eq 'one stop zero - hotel echo lima lima oscar - whiskey oscar romeo lima delta stop'
      expect(j['encode']).to eq ["one", "stop", "zero", "-", "hotel", "echo", "lima", "lima", "oscar", "-", "whiskey", "oscar", "romeo", "lima", "delta", "stop"]
      expect(j['yell']).to eq 'ONE STOP ZERO - HOTEL ECHO LIMA LIMA OSCAR - WHISKEY OSCAR ROMEO LIMA DELTA STOP'
    end
  end

end

describe NATOPhone::Decoder do

  let(:dec) { NATOPhone::Decoder.new('one point zero - hotel echo lima lima oscar - whiskey oscar romeo lima delta stop') }

  describe "#args" do
    it "shows args" do
      expect(dec.args).to eq 'one point zero - hotel echo lima lima oscar - whiskey oscar romeo lima delta stop'
    end
  end

  describe "#translate" do
    it "shows translation" do
      expect(dec.translate).to eq '1.0 hello world.'
    end
  end

  describe "#decode" do
    it "shows decoded result" do
      expect(dec.decode).to eq ["1", ".", "0", " ", "h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d", "."]
    end
  end

  describe "#yell" do
    it "shows the yell string" do
      expect(dec.yell).to eq '1.0 HELLO WORLD.'
    end
  end

  describe "#to_json" do
    it "outputs json" do
      j = JSON.parse(dec.to_json)
      expect(j['args']).to eq 'one point zero - hotel echo lima lima oscar - whiskey oscar romeo lima delta stop'
      expect(j['translate']).to eq '1.0 hello world.'
      expect(j['decode']).to eq ["1", ".", "0", " ", "h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d", "."]
      expect(j['yell']).to eq '1.0 HELLO WORLD.'
    end
  end

end

