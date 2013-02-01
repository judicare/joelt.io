module ApplicationHelper
  def markdown(text, entry, nocache = false)
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code_blocks, :gh_blockcode]
    Rails.cache.fetch("#{entry.slug}-#{entry.updated_at}", compress: true, force: nocache) {
      syntax_highlighter(Redcarpet::Markdown.new(Redcarpet::Render::HTML, Hash[options.map{|k|[k,true]}]).render(text))
    }.html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre/code").each do |code|
      code.parent.replace("<figure>" + Pygments.highlight(code.text.rstrip, lexer: code[:class], formatter: 'html', options: {encoding: 'utf-8', linenostart: 1, linenos: 'table'}) + "</figure>")
    end
    doc.at_css("body").inner_html.to_s
  end
  
  def literate_haskell html
    html.gsub(/^> /, "").strip.gsub(/``` haskell\r\n(.*?)```/m) do
      $1.split("\r\n").map{|x|"> #{x}"}.join("\n")
    end.gsub("&lt;", "<").gsub("&gt;", ">").gsub("\r", "")
  end
  
  def title t
    content_for(:title) { t }
  end
  
  def body_class t
    content_for(:body_class) { t }
  end
end
