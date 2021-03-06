require 'test_helper'

describe HTTP do

  after do
    HTTP::Client.base_uri = ''
  end

  it "must set the base_uri" do
    HTTP::Client.base_uri = 'localhost:3000'
    HTTP::Client.base_uri.must_equal 'localhost:3000'
  end

  it "must successfully perform a get with an absolute url" do
    response = HTTP::Client.get 'http://www.google.com'
    response.code.must_equal 200
    response.parsed_body.wont_be_nil
    response.headers.wont_be_nil
    response.http_response.wont_be_nil
  end

  it "must perform a get with only a domain" do
    response = HTTP::Client.get 'google.com'
    response.code.must_equal 200
    response.parsed_body.wont_be_nil
    response.headers.wont_be_nil
    response.http_response.wont_be_nil
  end

  it "must perform a get with domain and www" do
    response = HTTP::Client.get 'www.google.com'
    response.code.must_equal 200
    response.parsed_body.wont_be_nil
    response.headers.wont_be_nil
    response.http_response.wont_be_nil
  end

  it "must perform a get after setting base_uri" do
    HTTP::Client.base_uri = 'google.com'
    response = HTTP::Client.get '/'
    response.code.must_equal 200
    response.parsed_body.wont_be_nil
    response.headers.wont_be_nil
    response.http_response.wont_be_nil
  end

  it "must get a 404" do
    response = HTTP::Client.get 'google.com/this_is_a_fake_uri'
    response.code.must_equal 404
    response.parsed_body.wont_be_nil
    response.headers.wont_be_nil
    response.http_response.wont_be_nil
  end
end
