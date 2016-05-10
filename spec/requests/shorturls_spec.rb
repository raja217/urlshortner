require 'rails_helper'

RSpec.describe "Shorturls", type: :request do
  describe "GET /shorturls" do
    it "creates a Url and redirects to the root page" do
    get "http://localhost/"
    expect(response).to render_template(:new)

    post "http://localhost/shorturls", :shorturl => {:originalurl => "http://www.google.com"}

    expect(response).to redirect_to root_url
  end
  end
end
