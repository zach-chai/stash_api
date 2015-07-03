require 'test_helper'

describe StashAPI do
  it 'must have a valid version' do
    StashAPI::VERSION.wont_be_nil
  end

  it 'must test something useful' do
    false.must_equal true
  end
end
