require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  
  let(:user) {User.create(email: "test@mail.com", password: "password", confirmed_at: Time.now) }
  let(:wiki) {Wiki.create(user: user, title: "title", body: "body") }


  before :each do 
    sign_in user 
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new, user_id: user.id, id: wiki.id
      expect(response).to render_template :new
    end
    
  end
  
  
  describe "GET #show" do
    it "returns http success" do
      get :show, user_id: user.id, id: wiki.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #create" do
    # it "increases the number of Wikis by 1" do
    #     expect{ wiki :create, user_id: user.id, wiki: {title: "title", body: "body"} }.to change(Wiki,:count).by(1)
    # end
    
    
    it "redirects to the newly created wiki" do
      get :create, wiki: {title: "title", body: "body"}
      expect(response).to redirect_to [Wiki.last]
    end
    
    
  end

  describe "PUT #update" do
    it "returns http success" do
    put :update, user_id: user.id, id: wiki.id, wiki: {title: "new_title", body: "new_body"}
      expect(response).to redirect_to([wiki])
    end
  end

  describe "GET #edit" do ####################
    
    it "returns http success" do
      get :edit, user_id: user.id, id: wiki.id 
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #edit view" do
      get :edit, user_id: user.id, id: wiki.id 
      expect(response).to render_template :edit
    end
    
    it "assigns post to be updated to @wiki" do
      get :edit, user_id: user.id, id: wiki.id 
      wiki_instance = assigns(:wiki)

      expect(wiki_instance.id).to eq wiki.id
      expect(wiki_instance.title).to eq wiki.title
      expect(wiki_instance.body).to eq wiki.body
    end
    
    
  end
  
  
  
  describe "GET #destroy" do  #######################
    it "deletes the wiki" do
      delete :destroy, user_id: user.id, id: wiki.id 
      count = Wiki.where({id: wiki.id}).size
      expect(count).to eq 0
    end
    
    it "redirects to posts index" do
      delete :destroy, user_id: user.id, id: wiki.id
      expect(response).to redirect_to welcome_index_path
    end
    
    
  end



  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
