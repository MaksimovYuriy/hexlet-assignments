require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest

  setup do
    @task = tasks(:one)
    @attrs = {
      name: Faker::Artist.name,
      description: Faker::Movies::HarryPotter.quote,
      status: Faker::Movies::HarryPotter.spell,
      creator: Faker::Movies::HarryPotter.character,
      performer: Faker::Movies::HarryPotter.character,
      completed: Faker::Boolean.boolean
    }
  end

  test '#index' do
    get tasks_url
    assert_response :success
  end

  test '#new' do
    get new_task_url
    assert_response :success
  end

  test '#create' do
    post tasks_path, params: { task: @attrs }
    task = Task.find_by! name: @attrs[:name]
    assert_redirected_to task_url(task)
  end

  test '#show' do
    get task_url(@task)
    assert_response :success
  end

  test '#edit' do
    get edit_task_url(@task)
    assert_response :success
  end

  test '#update' do
    patch task_path(@task), params: { task: @attrs }
    assert_redirected_to task_url(@task)

    @task.reload

    assert { @task.name == @attrs[:name] }
  end

  test '#destroy' do
    delete task_path(@task)
    assert_redirected_to tasks_url
    assert { !Task.exists? @task.id }
  end
end
