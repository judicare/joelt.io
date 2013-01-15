class EntriesController < ApplicationController
  def home
  end
  
  def new
    @entry = Entry.new
  end
  
  def edit
    redirect_to :root unless session[:user_id]
    @entry = Entry.find(params[:id])
  end
  
  def update
    redirect_to :root unless session[:user_id]
    @entry = Entry.find(params[:id])
    if @entry.update_attributes params[:entry]
      redirect_to slug_entries_path(@entry.slug)
    else
      flash[:error] = @entry.errors.full_messages
      render :action => :edit, :entry => @entry
      # redirect_to :back
    end
  end
  
  def index
    @entries = Entry.find :all, :conditions => need_publish, :order => "created_at DESC"
  end
  
  def by_tag
    @tag = Tag.find_by_slug(params[:tag]) || not_found
    @entries = @tag.entries.find :all, :conditions => need_publish, :order => "created_at DESC"
  end
  
  def by_type
    @entries = Entry.find :all, :conditions => { :entry_type => params[:type] }.merge(need_publish), :order => "created_at DESC"
  end
  
  def by_slug
    @entry = Entry.find_by_slug(params[:slug]) || not_found
    redirect_to :root unless session[:user_id] || @entry.published
  end
  
  private
  def need_publish
    session[:user_id] ? {} : { :published => true }
  end
end
