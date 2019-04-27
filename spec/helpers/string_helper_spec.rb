require "./helpers/string_helper"

describe StringHelper do
    context "Testing StringHelper class, function check_balance_parenthesis" do

        it "case string '([()][][{}])'" do
            string = "([()][][{}])"
            expected_result = true

            result = StringHelper.check_balance_parenthesis(string)
            expect(result).to eq expected_result
        end

        it "case string '[(])'" do
            string = "[(])"
            expected_result = false

            result = StringHelper.check_balance_parenthesis(string)
            expect(result).to eq expected_result
        end

        it "case string '[(,,),(,,[])]'" do
            string = "[(,,),(,,[])]"
            expected_result = true

            result = StringHelper.check_balance_parenthesis(string)
            expect(result).to eq expected_result
        end

        it "case string '[(,,,(,,[])]'" do
            string = "[(,,,(,,[])]"
            expected_result = false

            result = StringHelper.check_balance_parenthesis(string)
            expect(result).to eq expected_result
        end

        it "case a chunk of code success" do
            string = <<-eos
                public static void main(String args[])
                {
                    System.out.println("Hello world");
                }
            eos
            expected_result = true

            result = StringHelper.check_balance_parenthesis(string)
            expect(result).to eq expected_result
        end

        it "case a chunk of code failed" do
            string = <<-eos
                public static void main(String args[])
                {
                    System.out.println("Hello world";
                }
            eos
            expected_result = false

            result = StringHelper.check_balance_parenthesis(string)
            expect(result).to eq expected_result
        end

        it "case empty string" do
            string = ""
            expected_result = true

            result = StringHelper.check_balance_parenthesis(string)
            expect(result).to eq expected_result
        end

        it "case input integer" do
            string = 11234

            expect {
                result = StringHelper.check_balance_parenthesis(string)
            }.to raise_error ArgumentError

        end

        it "case input float" do
            string = 123.88

            expect {
                result = StringHelper.check_balance_parenthesis(string)
            }.to raise_error ArgumentError

        end

    end
end
