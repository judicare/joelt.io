module EntriesHelper
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
  
  def fancy_img e
    return if e.image.width.nil?
    if e.image.width(:post) >= e.image.width
      image_tag(e.image.url, :class => "noshadow")
    else
      link_to image_tag(e.image.url, :class => "noshadow"), e.image.url, :class => "fancy", :style => "height: #{[e.image.height, 110].min}px"
    end
  end
end
