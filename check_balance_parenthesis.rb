require "./helpers/string_helper"

require "optparse"

options = {}
# OptionParser for more mearningful command line help
optparse = OptionParser.new do |parser|
    parser.on(
        "-s",
        "--string STRING",
        String,
        "the STRING to be checked"
    ) do |string|
        options[:string] = string
    end
end.parse!

# check the required arguments
begin
    optparse.parse!
    mandatory = [:string]
    missing = mandatory.select{ |param| options[param].nil? }
    unless missing.empty?
        raise OptionParser::MissingArgument.new(missing.join(', '))
    end
rescue OptionParser::InvalidOption, OptionParser::MissingArgument
    puts $!.to_s
    puts optparse
    exit
end

string = options[:string]

result = StringHelper.check_balance_parenthesis(string)
if result
    puts string + " is balanced"
else
    puts string + " is not balanced"
end