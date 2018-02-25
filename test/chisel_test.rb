require './test/test_helper'
require './lib/parser'
require 'pry'

class ConverterTest < Minitest::Test
  def setup
    @parser = Parser.new
  end

  def test_it_exists
    assert_instance_of Parser, @parser
  end

  def test_it_can_parse_a_paragraph
    paragraph = 'This is a paragraph.'
    assert_equal "<p>#{paragraph}</p>", @parser.parse(paragraph)
  end

  def test_it_can_parse_two_paragraphs
    paragraph = "This is the first line of the paragraph.
    This is the second line of the same paragraph."
    assert_equal"<p>#{paragraph}</p>", @parser.parse(paragraph)
  end

  def test_it_can_parse_a_header
    header = '# This is a header'
    assert_equal "<h1>#{header}</h1>", @parser.parse(header)
  end
end
