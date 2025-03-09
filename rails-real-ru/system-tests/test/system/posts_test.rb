# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class PostsTest < ApplicationSystemTestCase

    setup do
        @post = posts(:one)
    end

    test 'visiting index' do
        visit posts_url
        assert_selector 'h1', text: 'Posts'
    end

    test 'creating post' do
        visit posts_url
        click_on 'New Post'

        fill_in 'Title', with: 'Test Title'
        fill_in 'Body', with: 'Test body'

        click_on 'Create Post'
        assert_text 'Post was successfully created.'
    end

    test 'updating post' do
        visit posts_url
        click_on 'Edit', match: :first
        
        fill_in 'Title', with: 'Updated title'

        click_on 'Update Post'
        assert_text 'Post was successfully updated.'
    end

    test 'destroying post' do
        visit posts_url

        page.accept_confirm do
           click_on 'Destroy', match: :first
        end

        assert_text 'Post was successfully destroyed'
    end

end
# END
