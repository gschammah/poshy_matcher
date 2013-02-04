require 'treetop'
require "poshy/version"

POSHY_ROOT = File.expand_path(File.dirname(__FILE__))
MONGOID_QUERY_GRAMMAR     = File.join(POSHY_ROOT, 'poshy', 'grammars', 'mongoid_query.treetop')
ATTRIBUTE_MATCHER_GRAMMAR = File.join(POSHY_ROOT, 'poshy', 'grammars', 'attribute_matcher.treetop')

Treetop.load MONGOID_QUERY_GRAMMAR
Treetop.load ATTRIBUTE_MATCHER_GRAMMAR


module Poshy
  extend self

  class CompiledEntity < Struct.new(:compiled)
    def criteria_for(context)
      compiled.criteria(context)
    end
  end

  def attribute_matcher_parser
    @attribute_matcher ||= AttributeMatcherParser.new
  end

  def mongoid_query_parser
    @mongoid_query_parser ||= MongoidQueryParser.new
  end

  def match?(query, attributes)
    attribute_matcher_parser.parse(query).eval(attributes)
  end

  def compile_entity(query)
    CompiledEntity.new(mongoid_query_parser.parse(query))
  end
end
