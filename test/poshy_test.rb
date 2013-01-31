require 'test/unit'
require 'rubygems'

require File.dirname(__FILE__) + "/../lib/poshy_matcher"

class PoshyParserTest < Test::Unit::TestCase

  def test_simple_expression
    assert_match 'name=john', { 'name' => 'john' },     'simple expression (=)'
    assert_match 'name!=jon', { 'name' => 'john' },     'simple expression (!=)'
    assert_match 'age>10', { 'age' => 11 },             'simple expression (>)'
    assert_match 'age>=10', { 'age' => 10 },            'simple expression (>=)'
    assert_match 'age<10', { 'age' => 9 },              'simple expression (<)'
    assert_match 'age<=10', { 'age' => 10 },            'simple expression (<=)'
    assert_match '(name=john)', { 'name' => 'john' },   'simple expression parens'
    assert_match '((name=john))', { 'name' => 'john' }, 'simple expression double parens'
  end

  def test_simple_boolean
    assert_match 'name=john&age>20', { 'name' => 'john', 'age' => 30 },     'simple boolean (AND)'
    assert_match '(name=john&age>20)', { 'name' => 'john', 'age' => 30 },   'simple boolean (AND) parens'
    assert_match '(name=john)&(age>20)', { 'name' => 'john', 'age' => 30 }, 'simple boolean (AND) individual parens'
    assert_match '(name!=jon)&age>20', { 'name' => 'john', 'age' => 30 },   'simple boolean (AND) single parens'
    assert_match '(name=jon)|age>20', { 'name' => 'john', 'age' => 30 },    'simple boolean (OR) single parens'
  end

  def test_compound_boolean
    assert_match 'name=invalid|(name=john&age>20)', { 'name' => 'john', 'age' => 30 },  'compound boolean'
    assert_match '(name=invalid|name=john)&age>20', { 'name' => 'john', 'age' => 30 }, 'compound boolean (commutative)'
  end

  def test_alphanumeric
    assert_match 'code=john123', { 'code' => 'john123' }, 'alphanumeric'
  end

  def test_nil
    assert_equal parse('firstname=john', 'name' => 'john'), false, 'unexistent key'
  end

  def assert_match(query, input, desc)
    assert parse(query, input), desc
  end

  def parse(query, input)
    PoshyMatcher.match?(query, input)
  end

end
