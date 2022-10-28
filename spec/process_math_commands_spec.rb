require_relative "../ProcessMathCommands"
require "pry"

RSpec.describe ProcessMathCommands do
    subject(:calculate) { described_class.new(command) }

    describe "when the command is valid" do
        context "ADD 12, 45" do
            let(:command) { "ADD 12, 45" }

            it "execute operation of sum" do
                expect(calculate.execute).to eq("%.2f" % 57)
            end
        end

        context "SUB 12, -37.5" do
            let(:command) { "SUB 12, -37.5" }

            it "execute operation of sum" do
                expect(calculate.execute).to eq("%.2f" % 49.5)
            end
        end

        context "MUL 0, +346" do
            let(:command) { "MUL 0, +346" }

            it "execute operation of sum" do
                expect(calculate.execute).to eq("%.2f" % 0)
            end
        end

        context "DIV 234, -34.56" do
            let(:command) { "DIV 234, -34.56" }

            it "execute operation of sum" do
                expect(calculate.execute).to eq("%.2f" % -6.77)
            end
        end
    end

    describe "when command is wrong" do
        let(:message) { /Operation not found!/ }
        context "12, 45 ADD" do
            let(:command) { "12, 45 ADD" }

            it "raise an error" do
                expect { calculate.execute }.to raise_error.with_message(message)
            end
        end

        context "12, -37.5" do
            let(:command) { "12, -37.5" }

            it "raise an error" do
                expect { calculate.execute }.to raise_error.with_message(message)
            end
        end
    end

    context "when divided by zero" do
        let(:command) { "DIV 234, 0" }
        it "raise an error" do
            expect { calculate.execute }.to raise_error.with_message(/Indetermined division by zero!/)
        end
    end
end
