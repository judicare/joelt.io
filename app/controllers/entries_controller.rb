class EntriesController < ApplicationController
  before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]
  
  def home
  end
  
  def new
    @entry = Entry.new
  end
  
  def create
    @entry = Entry.new params.require(:entry).permit(*Entry::ACCESSIBLE_FIELDS)
    if @entry.save
      redirect_to slug_entries_path(@entry.slug)
    else
      render action: :new, entry: @entry
    end
  end
  
  def edit
    @entry = Entry.find(params[:id])
    @entry.tag_list = @entry.tags.map(&:name).join(" ")
  end
  
  def update
    @entry = Entry.find(params[:id])
    if @entry.update_attributes params.require(:entry).permit(*Entry::ACCESSIBLE_FIELDS)
      redirect_to edit_entry_path(@entry)
    else
      render action: :edit, entry: @entry
    end
  end
  
  def destroy
    Entry.destroy params[:id]
    redirect_to all_path
  end
  
  def index
    @entries = Entry.where(need_publish).order("created_at DESC").page(params[:page])
    
    respond_to do |format|
      format.html
      format.rss { render layout: false }
    end
  end
  
  def by_tag
    @tag = Tag.find_by_slug(params[:tag]) || not_found
    @entries = @tag.entries.where(need_publish).order("created_at DESC").page(params[:page])
  end
  
  def by_type
    hsh = { entry_type: params[:type] }.merge(need_publish)
    @entries = Entry.where(hsh).order("created_at DESC").page(params[:page])
  end
  
  def by_slug
    @entry = Entry.find_by_slug(params[:slug]) || not_found
    @next = Entry.where("id > ?", @entry.id).order("id ASC").first
    @prev = Entry.where("id < ?", @entry.id).order("id DESC").first
    begin
      redirect_to :root
      return
    end unless session[:user_id] || @entry.published
    
    respond_to do |format|
      format.html
      format.lhs { render :layout => false }
    end
  end
  
  private
  def need_publish
    session[:user_id] ? {} : { published: true }
  end
  
  def authorize
    redirect_to :root unless session[:user_id]
  end
end
