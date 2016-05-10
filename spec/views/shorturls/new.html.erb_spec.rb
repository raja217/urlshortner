require 'rails_helper'

RSpec.describe "shorturls/new", type: :view do
  before(:each) do
    assign(:shorturl, Shorturl.new(
      :originalurl => "http://www.google.com",
      :shorturl => "MyString",
      :clicks => "MyString"
    ))
  end

  it "renders new shorturl form" do
    render

    assert_select "form[action=?][method=?]", shorturls_path, "post" do

      assert_select "input#shorturl_originalurl[name=?]", "shorturl[originalurl]"

      
    end
  end
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