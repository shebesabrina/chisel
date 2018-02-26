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
      symbol_index = markdown_text.split.shift #
      symbol = markdown_headers.fetch(symbol_index) #finds the value of the headers key
      symbol_value = symbol.index(" ") #finds the space in the value
      symbol.insert(symbol_value, markdown_text) #Adds the text to the HTML format
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
end
