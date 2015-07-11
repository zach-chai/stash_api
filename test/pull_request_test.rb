require 'test_helper'

describe StashAPI::PullRequest do

  before do
    StashAPI::Core.projects('id').repos('id').pull_requests('id')
  end

  after do
    StashAPI::Options.reset_defaults
    StashAPI::PullRequest.reset_resource_chain
  end

  describe 'comments' do

    it 'must return pull_request resource' do
      StashAPI::PullRequest.comments('id').must_equal StashAPI::Comment
    end

    it 'must raise error if key is missing' do
      StashAPI::PullRequest.reset_resource_chain
      Proc.new {
        StashAPI::PullRequest.comments
      }.must_raise 'previous resource has no key to allow chaining'
    end

    it 'must append pull_requests to path' do
      StashAPI::PullRequest.comments.resource_path.must_equal '/api/1.0/projects/id/repos/id/pull-requests/id/comments'
    end
  end
end
