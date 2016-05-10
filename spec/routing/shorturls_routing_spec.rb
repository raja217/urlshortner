require "rails_helper"

RSpec.describe ShorturlsController, type: :routing do
  describe "routing" do
    let(:url)     { "http://localhost"     }
    it "routes to #new" do
      expect(:get => "#{url}/").to route_to("shorturls#new", :host => 'localhost')
    end

    it "routes to #create" do
      expect(:post => "#{url}/shorturls").to route_to("shorturls#create", :host => 'localhost')
    end

    it "routes to #destroy" do
      expect(:delete => "#{url}/shorturls/1").to route_to("shorturls#destroy", :id => "1", :host => 'localhost')
    end
  end

end
