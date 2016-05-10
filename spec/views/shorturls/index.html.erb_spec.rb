require 'rails_helper'

RSpec.describe "shorturls/index", type: :view do
  before(:each) do
    assign(:shorturls, [
      Shorturl.create!(
        :originalurl => "http://www.google.com",

      ),
      Shorturl.create!(
        :originalurl => "http://www.yahoo.com",

      )
    ])
  end

  it "renders a list of shorturls" do
    render
    assert_select "tr>td", :text => "http://www.google.com".to_s, :count => 1
    assert_select "tr>td", :text => "http://www.yahoo.com".to_s, :count => 1
  end
end
