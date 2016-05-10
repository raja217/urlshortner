require 'rails_helper'

RSpec.describe Shorturl, type: :model do
  it "orders by id" do
    url1 = Shorturl.create!(originalurl: "http://www.google.com")
    url2 = Shorturl.create!(originalurl: "http://www.google.com")
   end

end
