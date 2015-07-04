require 'test_helper'

describe StashAPI do

  it 'must have a gem version' do
    StashAPI::VERSION.wont_be_nil
  end
end
