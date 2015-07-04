require 'test_helper'

describe StashAPI::Options do

  after do
    StashAPI::Options.reset_defaults
  end

  it 'must return options hash' do
    StashAPI::Options.options.must_equal Hash.new
  end

  it 'must reset the base_uri when defaults are reset' do
    StashAPI::Options.option :domain, 'localhost'

    # at this point the base_uri is set
    HTTP::Client.base_uri.must_equal 'localhost/rest'

    # reset the defaults and check base_uri is empty
    StashAPI::Options.reset_defaults
    HTTP::Client.base_uri.must_equal ''
  end

  describe 'option' do

    before do
      StashAPI::Options.option :domain, 'localhost'
    end

    it 'must return an options value' do
      StashAPI::Options.option(:domain).must_equal 'localhost'
    end

    it 'must set an options value' do
      domain = 'localhost:3000'
      StashAPI::Options.option :domain, domain
      StashAPI::Options.option(:domain).must_equal domain
    end

    it 'must build the base_uri on domain change' do
      # ensure clean state
      HTTP::Client.base_uri.must_equal 'localhost/rest'

      # build base_uri
      StashAPI::Options.option :domain, 'localhost:3000'
      HTTP::Client.base_uri.must_equal 'localhost:3000/rest'
    end
  end
end
