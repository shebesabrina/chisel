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
    parser_1 = Parser.new("# My Life in Desserts")
    parser_2 = Parser.new("## My Life in Desserts")
    parser_3 = Parser.new("### My Life in Desserts")
    parser_4 = Parser.new("#### My Life in Desserts")
    parser_5 = Parser.new("##### My Life in Desserts")
    parser_6 = Parser.new("###### My Life in Desserts")

    header = "My Life in Desserts"
    assert_equal "<h1>#{header}</h1>", parser_1.header
    assert_equal "<h2>#{header}</h2>", parser_2.header
    assert_equal "<h3>#{header}</h3>", parser_3.header
    assert_equal "<h4>#{header}</h4>", parser_4.header
    assert_equal "<h5>#{header}</h5>", parser_5.header
    assert_equal "<h6>#{header}</h6>", parser_6.header
  end

  def test_it_can_parse_a_style
    parser = Parser.new("**stronged**")

    assert_equal "<strong>stronged</strong>", parser.style
  end

  def test_it_can_parse_an_emphasis
    parser = Parser.new("My *emphasized and **stronged** text* is awesome.")

    result = "My <em>emphasized and <strong>stronged</strong text</em> is awesome."
    assert_equal result, parser.emphasis
  end
end
