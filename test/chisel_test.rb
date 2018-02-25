require './test/test_helper'
require './lib/parser'
require 'pry'

class ConverterTest < Minitest::Test

  def test_it_exists
    parser = Parser.new("This is the first line of a paragraph.")
    assert_instance_of Parser, parser
  end

  def test_it_can_parse_a_paragraph
    parser = Parser.new("This is the first line of a paragraph.")

    string = "This is the first line of a paragraph."
    assert_equal "<p>#{string}</p>", parser.paragraph
  end

  def test_it_can_parse_two_paragraphs
    parser = Parser.new("This is the first line of a paragraph. This is a second paragraph.")

    string = "This is the first line of a paragraph. This is a second paragraph."
    assert_equal"<p>#{string}</p>", parser.paragraph
  end

  def test_it_can_parse_a_header
    skip
    header = '# This is a header'
    assert_equal "<h1>#{header}</h1>", @parser.header
  end
end
