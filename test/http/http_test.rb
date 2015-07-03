require 'test_helper'

describe HTTP do

  it "must receive a 200 response" do
    response = HTTP::Client.get 'http://www.google.com'
    response.code.must_equal 200
  end

  it "must perform a get using the host" do
  	HTTP::Client.host = 'google.com'
  	response = HTTP::Client.get '/'
    response.code.must_equal 200
  end
end
