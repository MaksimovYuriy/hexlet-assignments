# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

require 'minitest/autorun'
require 'minitest/power_assert'

class StackTest < Minitest::Test
  # BEGIN
  
  def test_push1
    stack = Stack.new [1, 2, 3]
    stack.push!(5)
    exp_a = [1, 2, 3, 5]
    assert_equal(stack.to_a, exp_a)
  end

  def test_push2
    stack = Stack.new
    stack.push!(5)
    exp_a = [5]
    assert_equal(stack.to_a, exp_a)
  end

  def test_push3
    stack = Stack.new [10, 10, 10]
    stack.push!(20)
    exp_a = [10, 10, 10, 20]
    assert_equal(stack.to_a, exp_a)
  end

  def test_pop1
    stack = Stack.new [1, 2, 3]
    exp_el = 3
    assert_equal(stack.pop!, exp_el)
    assert_equal(stack.to_a, [1, 2])
  end

  def test_pop2
    stack = Stack.new [1]
    exp_el = 1
    assert_equal(stack.pop!, exp_el)
    assert_equal(stack.to_a, [])
  end

  def test_pop3
    stack = Stack.new [100, 200, -5]
    exp_el = -5
    assert_equal(stack.pop!, exp_el)
    assert_equal(stack.to_a, [100, 200])
  end

  def test_clear1
    stack = Stack.new [1, 2, 3]
    stack.clear!
    assert_equal(stack.to_a, [])
  end

  def test_clear2
    stack = Stack.new [1, 2, 3]
    stack.clear!
    assert_equal(stack.size, 0)
  end

  def test_clear3
    stack = Stack.new [10, 20, -5]
    stack.clear!
    assert_equal(stack.to_a, [])
    assert_equal(stack.size, 0)
  end

  def test_empty1
    stack = Stack.new [10, 10, 10]
    exp = false
    assert_equal(stack.empty?, exp)
  end

  def test_empty2
    stack = Stack.new []
    exp = true
    assert_equal(stack.empty?, exp)
  end

  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
