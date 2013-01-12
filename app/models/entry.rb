class Entry < ActiveRecord::Base
  has_and_belongs_to_many :tags
  attr_accessible :title, :content
  
  before_create :create_slug
  before_update :create_slug
  
  def preview
    self.content.split(/\n\n/)[0]
  end
  
  private
  def create_slug
    self.slug = case self.entry_type
    when "code"
      self.title.split(/,/)[0].parameterize
    else
      self.title.parameterize
    end
  end
end
