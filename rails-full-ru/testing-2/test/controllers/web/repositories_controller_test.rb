# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @github_api_url = "https://api.github.com/repos/octocat/Hello-World"
    @github_repo_url = "https://github.com/octocat/Hello-World"
  end
  # BEGIN
  test 'should create' do
    fixture_body = load_fixture('files/response.json')

    stub_request(:get, @github_api_url)
      .to_return(status: 200, body: fixture_body, headers: { "Content-Type" => "application/json" })
    
    post repositories_path, params: { repository: { link: @github_repo_url} }

    assert_response :redirect

    repository = Repository.last
    parsed_body = JSON.parse(fixture_body)

    assert_equal repository.description, parsed_body['description']
    assert_equal repository.language, parsed_body['language']
  end
  # END
end
