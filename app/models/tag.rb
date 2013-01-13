class Tag < ActiveRecord::Base
  has_and_belongs_to_many :entries
  
  before_create :create_slug
  before_update :create_slug
  
  validates_presence_of :name
  validates_uniqueness_of :slug
  
  private
  def create_slug
    self.slug = self.name.parameterize
  end
end
