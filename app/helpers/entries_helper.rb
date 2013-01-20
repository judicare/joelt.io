# encoding: utf-8

module EntriesHelper
  def links entry
    link_to "μ Comments →", slug_entries_path(entry.slug) + "#disqus_thread", class: "read_more"
  end
  
  def linkify_title e
    first_word = e.title.split(/,/)[0]
    rest = e.title[first_word.length..-1]
    "#{link_to first_word, e.link}#{rest}".html_safe
  end
  
  def tag_list e, sep = ", "
    e.tags.map do |tag|
      content_tag :strong, (link_to tag.name, tagged_path(tag.slug))
    end.join(sep).html_safe
  end
  
  def fancy_img e, ty = :post
    return if e.image.width.nil?
    if e.image.width(:post) >= e.image.width
      image_tag(e.image.url, class: "noshadow")
    else
      link_to image_tag(e.image.url(ty == :tiny ? ty : :original), class: "noshadow"), e.image.url, class: "fancy", rel: "shadowbox", style: "height: #{[e.image.height, 110].min}px"
    end
  end
end
