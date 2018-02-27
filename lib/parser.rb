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
    binding.pry
    markdown_text.split.map { |style|
      style.start_with?("**") && style.end_with?("**") }
      symbol_index = markdown_text.split[0]
      symbol = markdown_style.fetch(symbol_index)
      symbol_update = markdown_text.split.drop(1)
      new_symbol = symbol_update.join(" ")
      symbol.gsub(" ", new_symbol)
    end
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

  def markdown_style
    {"*" => "<em> </em>",
    "**" => "<strong> </strong>"
    }
  end
end
