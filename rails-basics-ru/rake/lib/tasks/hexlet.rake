require 'csv'

namespace :hexlet do
  desc "Import users from .csv file"
  task :import_users, [:path] => :environment do |t, args|
    path = args[:path]
    data = CSV.read(path, headers: true)
    data.each do |row|
      first_name = row[0]
      last_name = row[1]
      birthday = row[2]
      email = row[3]
      User.create(first_name: first_name, last_name: last_name, birthday: birthday, email: email)
    end
  end
end
