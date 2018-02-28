require 'pry'
class Parser

  attr_reader :markdown_text
  def initialize(markdown_text)
    @markdown_text = markdown_text
  end

  def paragraph
    unless markdown_text.start_with?("#" || "*")
      @markdown_text = "<p>#{markdown_text}</p>"
    end
  end

  def header
    if markdown_text.start_with?('#')
      symbol_index = markdown_text.split[0]
      symbol = markdown_headers.fetch(symbol_index)
      symbol_update = markdown_text.split.drop(1)
      new_symbol = symbol_update.join(" ")
      symbol.gsub(" ", new_symbol)
    end
  end

  def style
    strong_start = /(?<=\s)\*\*(?!\*)/
    strong_start_string = /\A\*\*(?!\*)/
    strong_end = /\*\*(?=\s)/
    strong_end_string = /\*\*\Z/
    markdown_text.gsub(strong_start, "<strong>")
      .gsub(strong_end, "</strong>")
      .gsub(strong_end_string, "</strong>")
      .gsub(strong_start_string, "<strong>")
  end

  def emphasis
    em_start_string = /\A\*(?!\*)/
    em_start = /(?<=\s)[\*](?!\*)/
    em_end = /(?<!\*)\*(?=\s)/
    em_end_string = /(?<!\*)\*\Z/
    markdown_text.gsub(em_start, "<em>")
      .gsub(em_end, "</em>")
      .gsub(em_start_string, "<em>")
      .gsub(em_end_string, "</em>")
  end

  def markdown_headers
    { "#" => "<h1> </h1>",
      "##" => "<h2> </h2>",
      "###" => "<h3> </h3>",
      "####" => "<h4> </h4>",
      "#####" => "<h5> </h5>",
      "######" => "<h6> </h6>"
    }
  end

end
