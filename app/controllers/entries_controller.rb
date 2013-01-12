class EntriesController < ApplicationController
  def home
  end
  
  def index
    @entries = Entry.find :all, :order => "created_at DESC"
  end
  
  def by_tag
    @tag = Tag.find_by_slug(params[:tag])
    @entries = @tag.entries.order("created_at DESC")
  end
  
  def by_type
    @entries = Entry.find :all, :conditions => { :entry_type => params[:type] }, :order => "created_at DESC"
  end
  
  def by_slug
    @entry = Entry.find_by_slug params[:slug]
  end
end
