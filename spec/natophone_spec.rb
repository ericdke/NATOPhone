require_relative 'spec_helper'
require_relative 'helpers'

describe NATOPhone::Encoder do

  let(:enc) { NATOPhone::Encoder.new('1.0 Hello World.') }
  let(:enc2) { NATOPhone::Encoder.new(['1.0 Hello World.']) }

  describe "#args" do
    it "shows args" do
      expect(enc.args).to eq '1.0 Hello World.'
    end
    it "shows args" do
      expect(enc2.args).to eq ["1.0 Hello World."]
    end
  end

  describe "#translate" do
    str = 'one stop zero - hotel echo lima lima oscar - whiskey oscar romeo lima delta stop'
    it "shows translation" do
      expect(enc.translate).to eq str
    end
    it "shows translation" do
      expect(enc2.translate).to eq str
    end
  end

  describe "#encode" do
    arr = ["one", "stop", "zero", "-", "hotel", "echo", "lima", "lima", "oscar", "-", "whiskey", "oscar", "romeo", "lima", "delta", "stop"]
    it "shows encoded result" do
      expect(enc.encode).to eq arr
    end
    it "shows encoded result" do
      expect(enc2.encode).to eq arr
    end
  end

  describe "#yell" do
    str = 'ONE STOP ZERO - HOTEL ECHO LIMA LIMA OSCAR - WHISKEY OSCAR ROMEO LIMA DELTA STOP'
    it "shows the yell string" do
      expect(enc.yell).to eq str
    end
    it "shows the yell string" do
      expect(enc2.yell).to eq str
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
    it "outputs json" do
      j = JSON.parse(enc2.to_json)
      expect(j['args']).to eq ['1.0 Hello World.']
      expect(j['translate']).to eq 'one stop zero - hotel echo lima lima oscar - whiskey oscar romeo lima delta stop'
      expect(j['encode']).to eq ["one", "stop", "zero", "-", "hotel", "echo", "lima", "lima", "oscar", "-", "whiskey", "oscar", "romeo", "lima", "delta", "stop"]
      expect(j['yell']).to eq 'ONE STOP ZERO - HOTEL ECHO LIMA LIMA OSCAR - WHISKEY OSCAR ROMEO LIMA DELTA STOP'
    end
  end

  describe "type error" do
    it "raises a type error" do
      expect(lambda {NATOPhone::Encoder.new({'test' => 'Run, you fools!'})}).to raise_error(TypeError)
    end
  end

end

describe NATOPhone::Decoder do

  let(:dec) { NATOPhone::Decoder.new('one point zero - hotel echo lima lima oscar - whiskey oscar romeo lima delta stop') }
  let(:dec2) { NATOPhone::Decoder.new(['one point zero - hotel echo lima lima oscar - whiskey oscar romeo lima delta stop']) }

  describe "#args" do
    str = 'one point zero - hotel echo lima lima oscar - whiskey oscar romeo lima delta stop'
    it "shows args" do
      expect(dec.args).to eq str
    end
    it "shows args" do
      expect(dec2.args).to eq [str]
    end
  end

  describe "#translate" do
    str = '1.0 hello world.'
    it "shows translation" do
      expect(dec.translate).to eq str
    end
    it "shows translation" do
      expect(dec2.translate).to eq str
    end
  end

  describe "#decode" do
    arr = ["1", ".", "0", " ", "h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d", "."]
    it "shows decoded result" do
      expect(dec.decode).to eq arr
    end
    it "shows decoded result" do
      expect(dec2.decode).to eq arr
    end
  end

  describe "#yell" do
    str = '1.0 HELLO WORLD.'
    it "shows the yell string" do
      expect(dec.yell).to eq str
    end
    it "shows the yell string" do
      expect(dec2.yell).to eq str
    end
  end

  describe "#to_json" do
    arg = 'one point zero - hotel echo lima lima oscar - whiskey oscar romeo lima delta stop'
    trans = '1.0 hello world.'
    deco = ["1", ".", "0", " ", "h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d", "."]
    ye = '1.0 HELLO WORLD.'
    it "outputs json" do
      j = JSON.parse(dec.to_json)
      expect(j['args']).to eq arg
      expect(j['translate']).to eq trans
      expect(j['decode']).to eq deco
      expect(j['yell']).to eq ye
    end
    it "outputs json" do
      j = JSON.parse(dec2.to_json)
      expect(j['args']).to eq [arg]
      expect(j['translate']).to eq trans
      expect(j['decode']).to eq deco
      expect(j['yell']).to eq ye
    end
  end

  describe "type error" do
    it "raises a type error" do
      expect(lambda {NATOPhone::Decoder.new({'test' => 'Run, you fools!'})}).to raise_error(TypeError)
    end
  end

end

