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
  
  def around_links
    str = ""
    str << link_to("← #{@prev.title}", slug_entries_path(@prev.slug), class: "prev-link") if @prev
    str << link_to("#{@next.title} →", slug_entries_path(@next.slug), class: "next-link") if @next
    str.html_safe
  end
  
  def fancy_img e, ty = :post
    return if e.image.width.nil?
    if ty != :tiny && e.image.width(:post) >= e.image.width
      image_tag(e.image.url, class: "noshadow")
    else
      link_to image_tag(e.image.url(ty == :tiny ? ty : :original), class: "noshadow"), e.image.url, class: "fancy", rel: "shadowbox", style: "height: #{[e.image.height, 110].min}px"
    end
  end
  
  def edit_link entry
    link_to "Edit", edit_entry_path(entry)
  end
  
  def delete_link entry
    link_to "delete", entry_path(entry), method: :delete, confirm: "you sure?"
  end
end
