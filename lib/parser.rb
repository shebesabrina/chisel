
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
     markdown_symbol = markdown_text.gsub("#", "<h1>")
     markdown_symbol.split(" ").push("</h1>").join(" ")
   elsif markdown_text.start_with?('##')
     markdown_symbol = markdown_text.gsub("##", "<h2>")
     markdown_symbol.split(" ").push("</h2>").join(" ")
   elsif markdown_text.start_with?('###')
     markdown_symbol = markdown_text.gsub("###", "<h3>")
     markdown_symbol.split(" ").push("</h3>").join(" ")
   elsif markdown_text.start_with?('#####')
     markdown_symbol = markdown_text.gsub("#####", "<h4>")
     markdown_symbol.split(" ").push("</h5>").join(" ")
   elsif markdown_text.start_with?('######')
     markdown_symbol = markdown_text.gsub("######", "<h5>")
     markdown_symbol.split(" ").push("</h2>").join(" ")
   elsif markdown_text.start_with?('#######')
     markdown_symbol = markdown_text.gsub("#######", "<h6>")
     markdown_symbol.split(" ").push("</h2>").join(" ")
    end
  end
end
