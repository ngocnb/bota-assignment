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
end

# check the required arguments
begin
  optparse.parse!
  mandatory = [:string]
  missing = mandatory.select { |param| options[param].nil? }
  raise OptionParser::MissingArgument, missing.join(', ') unless missing.empty?
rescue OptionParser::InvalidOption, OptionParser::InvalidArgument, OptionParser::MissingArgument => e
  puts 'ERROR: ' + e.message
  puts '----------------------------------------------------------'
  puts optparse
  puts '----------------------------------------------------------'
  exit
end

string = options[:string]

begin
  result = StringHelper.check_balance_parenthesis(string)
  if result
    puts string + ' is balanced'
  else
    puts string + ' is not balanced'
  end
rescue Error => e
  puts 'ERROR: ' + e.message
end