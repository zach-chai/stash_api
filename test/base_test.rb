require 'test_helper'

describe StashAPI::Base do

  after do
    StashAPI::Options.reset_defaults
  end

  it 'must set the domain' do
    StashAPI::Base.domain.must_equal nil
    StashAPI::Base.domain 'localhost'
    StashAPI::Base.domain.must_equal 'localhost'
  end

  it 'must set user and password' do
    StashAPI::Base.basic_auth('user', 'pass').must_equal username: 'user', password: 'pass'
  end
end
