require 'test_helper'

describe StashAPI::Base do

  after do
    StashAPI::Options.reset_defaults
  end

  it "must set the domain" do
    StashAPI::Base.domain.must_be_nil
    StashAPI::Base.domain 'localhost'
    StashAPI::Base.domain.must_equal 'localhost'
  end

  it "must set user and password" do
    StashAPI::Base.basic_auth('user', 'pass').must_equal username: 'user', password: 'pass'
  end

  it "must remove trailing '/' if it exists" do
    StashAPI::Base.domain.must_be_nil
    StashAPI::Base.domain 'stash/'
    StashAPI::Base.domain.must_equal 'stash'
  end
end
