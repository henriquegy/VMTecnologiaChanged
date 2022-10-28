require_relative "../StringToHashOfChars"
require "pry"

RSpec.describe StringToHashOfChars do
    subject(:str_to_hash) { described_class.new(text) }

    context "when is string" do
        let(:text) { "O melhor lorem ipsum do mundis" }
        it "raise a hash of string" do
            expect(str_to_hash.execute).to include("o" => 4)
        end
    end

    context "when is'nt string" do
        let(:text) { 45 }
        it "raise an error" do
            expect { str_to_hash.execute }.to raise_error.with_message(/Oly string is permited./)
        end
    end
end
