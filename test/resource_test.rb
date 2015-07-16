require 'test_helper'

describe StashAPI::Resource do

  after do
    StashAPI::Options.reset_defaults
    StashAPI::Resource.reset_resource_chain
  end

  it 'must add resource to path' do
    StashAPI::Resource.add_resource_to_chain 0, 'resources'
    StashAPI::Resource.resource_path.must_equal '/api/1.0/resources'
  end

  it 'must add resource and id to path' do
    StashAPI::Resource.add_resource_to_chain 0, 'resources', 'id'
    StashAPI::Resource.resource_path.must_equal '/api/1.0/resources/id'
  end

  it 'must raise on missing dependent resource' do
    Proc.new {
      StashAPI::Resource.raise_resource_key_missing
    }.must_raise 'previous resource has no key to allow chaining'
  end

  describe 'fetch' do
    #TODO add more tests

    it 'must raise error if domain is not set' do
      Proc.new {
        StashAPI::Resource.fetch
      }.must_raise RuntimeError
    end
  end

  describe 'create_resource' do
    #TODO add more tests

    it 'must raise error if domain is not set' do
      Proc.new {
        StashAPI::Resource.create_resource data: 'data'
      }.must_raise RuntimeError
    end
  end

end