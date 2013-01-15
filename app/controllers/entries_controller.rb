class EntriesController < ApplicationController
  def home
  end
  
  def index
    @entries = Entry.find :all, :order => "created_at DESC"
  end
  
  def by_tag
    @entries = Entry.all :joins => :tags, :conditions => ["tags.slug = ?", params[:tag]]
  end
  
  def by_type
    @entries = Entry.find :all, :conditions => { :entry_type => params[:type] }, :order => "created_at DESC"
  end
  
  def by_slug
    @entry = Entry.find_by_slug(params[:slug]) || not_found
  end
end
