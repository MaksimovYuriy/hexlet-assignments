require 'octokit'

class RepositoryLoaderJob < ApplicationJob
  queue_as :default

  def perform(link)
    repository = Repository.find_or_create_by(link: link)
    repository.fetch!

    client = Octokit::Client.new
    octokit_repository = Octokit::Repository.from_url(link)
    github_data = client.repository(octokit_repository)

    if repository.update(
        owner_name: github_data[:owner][:login],
        repo_name: github_data[:name],
        description: github_data[:description],
        default_branch: github_data[:default_branch],
        watchers_count: github_data[:watchers_count],
        language: github_data[:language],
        repo_created_at: github_data[:created_at],
        repo_updated_at: github_data[:updated_at]
      )
      repository.success!
    else
      repository.fail!
    end
  end
end
