module ApplicationHelper
  def markdown(text)
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code_blocks, :gh_blockcode]
    syntax_highlighter(Redcarpet::Markdown.new(Redcarpet::Render::HTML, Hash[options.map{|k|[k,true]}]).render(text)).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace("<figure>" + Pygments.highlight(pre.text.rstrip, :lexer => pre[:lang], :formatter => 'html', :options => {:encoding => 'utf-8', :linenostart => 1, :linenos => 'table'}) + "</figure>")
    end
    doc.at_css("body").inner_html.to_s
  end
  
  def title t
    content_for(:title) { t }
  end
  
  def body_class t
    content_for(:body_class) { t }
  end
end
