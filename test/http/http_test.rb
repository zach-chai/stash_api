require 'test_helper'

describe HTTP do
  it "must get a 200 response" do
    response = HTTP::Client.get 'http://www.google.com'
    response.code.must_equal 200
  end
end
