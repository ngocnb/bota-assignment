require './helpers/string_helper'
require 'English'
require 'optparse'

options = {}
# OptionParser for more meaningful command line help
optparse = OptionParser.new do |parser|
  parser.on(
    '-s',
    '--string STRING',
    String,
    'the STRING to be checked'
  ) do |string|
    options[:string] = string
  end
end.parse!

# check the required arguments
begin
  optparse.parse!
  mandatory = [:string]
  missing = mandatory.select { |param| options[param].nil? }
  raise OptionParser::MissingArgument, missing.join(', ') unless missing.empty?
rescue OptionParser::InvalidOption, OptionParser::MissingArgument
  puts $ERROR_INFO.to_s
  puts optparse
  exit
end

string = options[:string]

result = StringHelper.check_balance_parenthesis(string)
if result
  puts string + ' is balanced'
else
  puts string + ' is not balanced'
end
