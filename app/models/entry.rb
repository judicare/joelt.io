class Entry < ActiveRecord::Base
  ACCESSIBLE_FIELDS = [:image, :title, :content, :published, :entry_type, :link, :tag_list]
  has_and_belongs_to_many :tags
  attr_accessor :tag_list
  
  has_attached_file :image, styles: { tiny: "175x24>", post: "650>" }
  
  validates_presence_of :title, :content, :entry_type
  validates_uniqueness_of :slug
  validates_inclusion_of :entry_type, in: %w(blog code design), message: "must be one of blog, code, design"
  validates_associated :tags
  
  before_save :create_slug, :update_tags
  
  paginates_per 10
  
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
    self.tags = @tag_list.split(/\s+/).map{|t|Tag.find_or_create_by name: t}
  end
end
