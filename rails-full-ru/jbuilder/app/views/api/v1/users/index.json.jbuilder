json.array! @users do |user|
    json.user do
        json.id user.id
        json.email user.email
        json.address user.address
        json.full_name "#{user.first_name} #{user.last_name}"
        json.posts user.posts do |post|
            json.partial! 'post', post: post
        end
    end
end