require 'csv'

namespace :hexlet do
  desc "Import users from .csv file"
  task :import_users, [:path] => :environment do |t, args|
    path = args[:path]
    users = []
    CSV.foreach(path, headers: true) do |row|
      first_name = row['first_name']
      last_name = row['last_name']
      birthday = Date.strptime(row['birthday'], "%m/%d/%Y")
      email = row['email']
      User.create(first_name: first_name, last_name: last_name, birthday: birthday, email: email)
      users.append(row)
    end
  end
end
