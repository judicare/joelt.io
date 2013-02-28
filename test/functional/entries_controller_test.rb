require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  def setup
    Fabricate(:user)
    Fabricate(:entry)
    Fabricate(:entry, published: false)
  end
  
  test "should have two entries" do
    assert_equal 2, Entry.count, "There should be two entries."
  end
  
  test "unregistered user should see one entry" do
    get :index
    assert_select 'article', 1
  end
  
  test "registered user should see two entries" do
    session[:user_id] = User.first.id
    get :index
    assert_select 'article', 2
  end
  
  test "unregistered user should view published entry just fine" do
    get :by_slug, slug: Entry.where(published: true).first.slug
    assert_response 200
  end
  
  test "unregistered user should be redirected when viewing unpublished entry" do
    get :by_slug, slug: Entry.where(published: false).first.slug
    assert_redirected_to controller: 'entries', action: 'home'
  end
  
  test "registered user should view unpublished entry just fine" do
    session[:user_id] = User.first.id
    get :by_slug, slug: Entry.where(published: true).first.slug
    assert_response 200
  end
  
  test "unregistered user should be redirected when editing any entry" do
    Entry.find_each do |e|
      get :edit, id: e.id
      assert_redirected_to controller: 'entries', action: 'home'
    end
  end
end
