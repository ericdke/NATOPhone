require_relative 'spec_helper'
require_relative 'helpers'

describe NATOPhone::NATOPhoneCLI do

  let(:cli) {NATOPhone::NATOPhoneCLI}

  describe "#encode" do
    it "encodes" do
      printed = capture_stdout do
        test = lambda {cli.start(['encode', 'hello world'])}
        test.call
      end
      expect(printed).to eq "\nhotel echo lima lima oscar - whiskey oscar romeo lima delta\n\n"
    end
    it "encodes" do
      printed = capture_stdout do
        test = lambda {cli.start(['encode', 'hello', 'world'])}
        test.call
      end
      expect(printed).to eq "\nhotel echo lima lima oscar - whiskey oscar romeo lima delta\n\n"
    end
  end

  describe "#decode" do
    it "decodes" do
      printed = capture_stdout do
        test = lambda {cli.start(['decode', 'hotel echo lima lima oscar - whiskey oscar romeo lima delta'])}
        test.call
      end
      expect(printed).to eq "\nhello world\n\n"
    end
    it "decodes" do
      printed = capture_stdout do
        test = lambda {cli.start(['decode', 'hotel', 'echo'])}
        test.call
      end
      expect(printed).to eq "\nhe\n\n"
    end
  end

end
