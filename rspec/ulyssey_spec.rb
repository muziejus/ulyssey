require_relative '../ulyssey'

RSpec.describe Ulyssey do

  let(:u) { Ulyssey.new }

  describe '#initialize' do
    context "when configs.yml is available" do
      it "finds configs.yml" do
        expect(File.exists?("configs.yml")).to eq(true)
      end

      it "assigns @configs" do
        expect(u.instance_variable_get(:@configs)).to_not be_nil
      end

      it "assigns @since_id" do
        expect(u.instance_variable_get(:@since_id)).to_not be_nil
      end

      it "assures that @since_id is an integer" do
        expect(u.instance_variable_get(:@since_id)).to be_an_integer
      end
    end

    context "when configs.yml is unavailable" do
      it "errors out usefully" do
        allow(File).to receive(:exists?).with("configs.yml").and_return(false)
        expect { Ulyssey.new }.to raise_error RuntimeError
      end
    end
  end

  describe '#random_sentence' do

    subject(:random_sentence) { u.random_sentence }
  end

end
