require 'test_helper'

describe StashAPI::Base do

  after do
    StashAPI::Options.reset_defaults
  end

  it 'must set the domain' do
    domain = 'localhost:3000'

    # ensure clean state
    StashAPI::Base.domain.must_equal nil

    # set a new domain
    StashAPI::Base.domain domain
    StashAPI::Base.domain.must_equal domain
  end
end
