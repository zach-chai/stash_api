require 'test_helper'

describe StashAPI::Core do

  before do

  end

  after do
    StashAPI::Options.reset_defaults
    StashAPI::Core.reset_resource_chain
  end

  describe 'projects' do

    it 'must return project resource' do
      StashAPI::Core.projects.must_equal StashAPI::Project
    end

    it 'must append projects to path' do
      StashAPI::Core.projects.resource_path.must_equal '/api/1.0/projects'
    end
  end

  describe 'users' do

    it 'must return user resource' do
      StashAPI::Core.users.must_equal StashAPI::User
    end

    it 'must append projects to path' do
      StashAPI::Core.users.resource_path.must_equal '/api/1.0/users'
    end
  end
end