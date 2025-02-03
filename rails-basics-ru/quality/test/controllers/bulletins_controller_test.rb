# frozen_string_literal: true

require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test '#root' do
    get root_path
    assert_response :success
  end

  test '#index' do
    get bulletins_url
    assert_response :success
    assert_select 'h1', 'Bulletins'
  end

  test '#show' do
    bulletin = bulletins(:bulletin_1)
    get bulletin_path(bulletin)
    assert_response :success
    assert_select 'h1', text: bulletin.title
  end
end
