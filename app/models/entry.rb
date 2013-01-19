class Entry < ActiveRecord::Base
  has_and_belongs_to_many :tags
  attr_accessor :tag_list
  attr_accessible :title, :content, :published, :entry_type, :image, :link, :tag_list
  
  attr_accessible :image
  has_attached_file :image, styles: { tiny: "175x24>", post: "650>" }
  
  before_save :update_tags
  
  validates_presence_of :title, :content, :entry_type
  validates_uniqueness_of :slug
  validates_inclusion_of :entry_type, in: %w(blog code design), message: "must be one of blog, code, design"
  validates_associated :tags
  
  before_save :create_slug
  
  def preview
    self.content.split(/(?:\r\n){2}/)[0]
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
  
  def update_tags
    self.tags = @tag_list.split(/\s+/).map{|t|Tag.find_or_create_by_name t}
  end
end
