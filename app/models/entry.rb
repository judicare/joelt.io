class Entry < ActiveRecord::Base
  has_and_belongs_to_many :tags
  attr_accessible :title, :content, :published, :entry_type, :image, :link
  
  attr_accessible :image
  has_attached_file :image, :styles => { :tiny => "x24>", :post => "650>" }
  
  validates_presence_of :title, :content, :entry_type
  validates_uniqueness_of :slug
  validates_inclusion_of :entry_type, :in => %w(blog code design), :message => "must be one of blog, code, design"
  validates_associated :tags
  
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
