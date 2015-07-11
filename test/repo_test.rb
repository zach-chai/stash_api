require 'test_helper'

describe StashAPI::Project do

  before do
    StashAPI::Core.projects('id').repos('id')
  end

  after do
    StashAPI::Options.reset_defaults
    StashAPI::Repo.reset_resource_chain
  end

  describe 'repos' do

    it 'must return pull_request resource' do
      StashAPI::Repo.pull_requests('id').must_equal StashAPI::PullRequest
    end

    it 'must raise error if key is missing' do
      StashAPI::Repo.reset_resource_chain
      Proc.new {
        StashAPI::Repo.pull_requests
      }.must_raise 'previous resource has no key to allow chaining'
    end

    it 'must append pull_requests to path' do
      StashAPI::Repo.pull_requests.resource_path.must_equal '/api/1.0/projects/id/repos/id/pull-requests'
    end
  end
end
