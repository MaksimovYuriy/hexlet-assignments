# frozen_string_literal: true

# BEGIN
require 'octokit'
# END

class Web::RepositoriesController < Web::ApplicationController
  def index
    @repositories = Repository.all
  end

  def new
    @repository = Repository.new
  end

  def show
    @repository = Repository.find params[:id]
  end

  def create
    # BEGIN
    client = Octokit::Client.new(access_token: ENV["GITHUB_TOKEN"])

    repository_url = permitted_params['link']
    octokit_repo = Octokit::Repository.from_url(repository_url)
    repository_data = client.repository(octokit_repo)

    @repository = Repository.new(
      link: repository_url,
      owner_name: repository_data.owner_name,
      repo_name: repository_data.repo_name,
      description: repository_data.description,
      default_branch: repository_data.default_branch,
      watchers_count: repository_data.watchers_count,
      language: repository_data.language,
      repo_created_at: repository_data.repo_created_at || DateTime.now,
      repo_updated_at: repository_data.repo_updated_at || DateTime.now
    )

    if @repository.save
      redirect_to repository_path(@repository)
    else
      render :new
    end
    # END
  end

  def edit
    @repository = Repository.find params[:id]
  end

  def update
    @repository = Repository.find params[:id]

    if @repository.update(permitted_params)
      redirect_to repositories_path, notice: t('success')
    else
      flash[:notice] = t('fail')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @repository = Repository.find params[:id]

    if @repository.destroy
      redirect_to repositories_path, notice: t('success')
    else
      redirect_to repositories_path, notice: t('fail')
    end
  end

  private

  def permitted_params
    params.require(:repository).permit(:link)
  end
end
