require 'rails_helper'

RSpec.describe ShorturlsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Shorturl. As you add validations to Shorturl, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {originalurl: 'http://www.google.com'} 
  }

  let(:invalid_attributes) {
    {originalurl: 'test'}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ShorturlsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all shorturls as @shorturls" do
      shorturl = Shorturl.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:shorturls)).to eq([shorturl])
    end
  end

  describe "GET #show" do
    it "assigns the requested shorturl as @shorturl" do
      shorturl = Shorturl.create! valid_attributes
      get :show, {:id => shorturl.to_param}, valid_session
      expect(assigns(:shorturl)).to eq(shorturl)
    end
  end

  describe "GET #new" do
    it "assigns a new shorturl as @shorturl" do
      shorturl = Shorturl.create! valid_attributes
      get :new, {}, valid_session
      expect(assigns(:shorturl)).to be_a_new(Shorturl)
    end
  end

  describe "GET #edit" do
    it "assigns the requested shorturl as @shorturl" do
      shorturl = Shorturl.create! valid_attributes
      get :edit, {:id => shorturl.to_param}, valid_session
      expect(assigns(:shorturl)).to eq(shorturl)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Shorturl" do
        expect {
          post :create, {:shorturl => valid_attributes}, valid_session
        }.to change(Shorturl, :count).by(1)
      end

      it "assigns a newly created shorturl as @shorturl" do
        post :create, {:shorturl => valid_attributes}, valid_session
        expect(assigns(:shorturl)).to be_a(Shorturl)
        expect(assigns(:shorturl)).to be_persisted
      end

      it "redirects to the created shorturl" do
        post :create, {:shorturl => valid_attributes}, valid_session
        expect(response).to redirect_to root_url
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved shorturl as @shorturl" do
        post :create, {:shorturl => invalid_attributes}, valid_session
        expect(assigns(:shorturl)).to be_a_new(Shorturl)
      end

      it "re-renders the 'new' template" do
        post :create, {:shorturl => invalid_attributes}, valid_session
        expect(response).to redirect_to root_url
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }


      it "assigns the requested shorturl as @shorturl" do
        shorturl = Shorturl.create! valid_attributes
        put :update, {:id => shorturl.to_param, :shorturl => valid_attributes}, valid_session
        expect(assigns(:shorturl)).to eq(shorturl)
      end

      it "redirects to the shorturl" do
        shorturl = Shorturl.create! valid_attributes
        put :update, {:id => shorturl.to_param, :shorturl => valid_attributes}, valid_session
        expect(response).to redirect_to(shorturl)
      end
    end

    context "with invalid params" do
      it "assigns the shorturl as @shorturl" do
        shorturl = Shorturl.create! valid_attributes
        put :update, {:id => shorturl.to_param, :shorturl => invalid_attributes}, valid_session
        expect(assigns(:shorturl)).to eq(shorturl)
      end

      it "re-renders the 'edit' template" do
        shorturl = Shorturl.create! valid_attributes
        put :update, {:id => shorturl.to_param, :shorturl => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested shorturl" do
      shorturl = Shorturl.create! valid_attributes
      expect {
        delete :destroy, {:id => shorturl.to_param}, valid_session
      }.to change(Shorturl, :count).by(-1)
    end

    it "redirects to the shorturls list" do
      shorturl = Shorturl.create! valid_attributes
      delete :destroy, {:id => shorturl.to_param}, valid_session
      expect(response).to redirect_to(shorturls_url)
    end
  end

end
