class Parser
  def parse(text)
    if text.start_with?('#')
      text.gsub("# #{text}", "<h1>#{text}</h1>")
    elsif text.start_with?('##')
      text.gsub("## #{text}", "<h2>#{text}</h2>")
    elsif text.start_with?('###')
      text.gsub("### #{text}", "<h3>#{text}</h3>")
    elsif text.start_with?('#####')
      text.gsub("##### #{text}", "<h4>#{text}</h4>")
    elsif text.start_with?('######')
      text.gsub("###### #{text}", "<h5>#{text}</h5>")
    elsif text.start_with?('#######')
      text.gsub("####### #{text}", "<h6>#{text}</h6>")
    else
      "<p>#{text}</p>"
    end
  end
end
