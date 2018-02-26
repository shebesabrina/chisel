require './test/test_helper'
require './lib/parser'
require 'pry'

class ConverterTest < Minitest::Test

  def test_it_exists
    parser = Parser.new("This is the first line of a paragraph.")
    assert_instance_of Parser, parser
  end

  def test_it_takes_input
    parser = Parser.new("This is the first line of a paragraph.")
    assert_equal "This is the first line of a paragraph.", parser.markdown_text
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
    parser = Parser.new("# My Life in Desserts")

    header = "My Life in Desserts"
    assert_equal "<h1> #{header} </h1>", parser.header
  end
end
