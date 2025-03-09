# frozen_string_literal: true

require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase

    test 'visiting comments of first post' do
        visit posts_url
        click_on 'Show', match: :first
        assert_selector 'h3', text: 'Comments'
    end

    test 'creating new comment' do
        visit posts_url
        click_on 'Show', match: :first

        fill_in 'post_comment[body]', with: 'test comment'

        click_on 'Create Comment'
        assert_text 'Comment was successfully created.'
    end

    test 'updating comment' do
        visit posts_url
        click_on 'Show', match: :first
        click_on 'Edit', match: :first

        fill_in 'post_comment[body]', with: 'test comment'
        click_on 'Update Comment'
        assert_text 'Comment was successfully updated.'
    end

    test 'destroying comment' do
        visit posts_url
        click_on 'Show', match: :first

        page.accept_confirm do
            click_on 'Delete', match: :first
        end

        assert_text 'Comment was successfully destroyed'
    end
end