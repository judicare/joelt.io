xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "otte.rs"
    xml.description "Functional programming by Joel Taylor"
    xml.link all_url
    
    @entries.each do |entry|
      xml.item do
        xml.title entry.title
        if entry.image.exists?
          xml.description markdown("![#{entry.title} image](http://otte.rs/#{entry.image.url(:post)})\n\n" + entry.content)
        else
          xml.description markdown(entry.content)
        end
        xml.pubDate entry.created_at.to_s(:rfc822)
        xml.link slug_entries_url(entry)
        xml.guid slug_entries_url(entry)
      end
    end
  end
end