require 'treetop'
require "poshy_matcher/version"

POSHY_ROOT    = File.expand_path(File.dirname(__FILE__))
POSHY_GRAMMAR = File.join(POSHY_ROOT, 'poshy_matcher', 'grammar', 'poshy.treetop')
POSHY_PARSER  = File.join(POSHY_ROOT, 'poshy_matcher', 'poshy_parser.rb')

begin
  require 'poshy_parser'
rescue LoadError
  Treetop.load POSHY_GRAMMAR
end

module PoshyMatcher
  extend self

  def parser
    @parser ||= PoshyParser.new
  end

  def match?(query, attributes)
    parser.parse(query).eval(attributes)
  end
end
