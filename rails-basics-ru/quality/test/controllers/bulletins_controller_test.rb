require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest

  test '#index' do
    get root_path
    assert_response :success
  end

end