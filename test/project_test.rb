require 'test_helper'

describe StashAPI::Project do

  before do
    StashAPI::Core.projects('id')
  end

  after do
    StashAPI::Options.reset_defaults
    StashAPI::Project.reset_resource_chain
  end

  describe 'repos' do

    it 'must return repo resource' do
      StashAPI::Project.repos('id').must_equal StashAPI::Repo
    end

    it 'must raise error if key is missing' do
      StashAPI::Project.reset_resource_chain
      Proc.new {
        StashAPI::Project.repos
      }.must_raise 'previous resource has no key to allow chaining'
    end

    it 'must append repos to path' do
      StashAPI::Project.repos.resource_path.must_equal '/api/1.0/projects/id/repos'
    end
  end
end
