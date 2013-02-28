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
  
  test "unregistered user should be redirected when creating an entry" do
    post :create, entry: Fabricate.build(:entry).attributes
    assert_redirected_to controller: 'entries', action: 'home'
  end
  
  test "registered user should be able to create a new entry" do
    session[:user_id] = User.first.id
    e = Fabricate.build(:entry)
    e.instance_eval { create_slug }
    post :create, entry: e.attributes
    assert_redirected_to controller: 'entries', action: 'by_slug', slug: e.slug
  end
  
  test "an ID included in the create hash should be ignored" do
    session[:user_id] = User.first.id
    e = Fabricate.build(:entry)
    e.id = Entry.first.id
    post :create, entry: e.attributes
    assert_equal 3, Entry.count
  end
  
  test "unregistered user should be redirected when editing any entry" do
    Entry.find_each do |e|
      get :edit, id: e.id
      assert_redirected_to controller: 'entries', action: 'home'
    end
  end
  
  test "registered user should be able to edit any entry" do
    session[:user_id] = User.first.id
    Entry.find_each do |e|
      get :edit, id: e.id
      assert_response 200
    end
  end
  
  test "unregistered user should be redirected when updating any entry" do
    Entry.find_each do |e|
      patch :update, id: e.id, entry: { entry_type: 'code' }
      assert_redirected_to controller: 'entries', action: 'home'
    end
  end
  
  test "registered user should be able to update any entry" do
    session[:user_id] = User.first.id
    Entry.find_each do |e|
      patch :update, id: e.id, entry: { entry_type: 'code' }
      assert_redirected_to controller: 'entries', action: 'edit', id: e.id
    end
  end
  
  test "unregistered user should be redirected when deleting any entry" do
    delete :destroy, id: Entry.first.id
    assert_redirected_to controller: 'entries', action: 'home'
    assert_equal Entry.count, 2
  end
  
  test "registered user should be able to delete any entry" do
    session[:user_id] = User.first.id
    delete :destroy, id: Entry.first.id
    assert_redirected_to controller: 'entries', action: 'index'
    assert_equal Entry.count, 1
  end
  
  test "tag pages should return properly tagged posts" do
    10.times do
      Fabricate(:entry, tag_list: "foo")
    end
    get :by_tag, tag: "foo"
    assert_select 'article', 10
  end
  
  test "type pages should return properly typed entries" do
    10.times do
      Fabricate(:entry, entry_type: "blog")
    end
    get :by_type, type: "blog"
    assert_select 'article', 10
  end
  
  test "pages should be cut off after 10" do
    20.times { Fabricate(:entry) }
    get :index
    assert_select 'article', 10
    assert_select 'nav .next'
  end
end
