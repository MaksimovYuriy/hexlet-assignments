require 'csv'

namespace :hexlet do
  desc "Import users from .csv file"
  task :import_users, [:path] => :environment do |t, args|
    path = args[:path]
    data = CSV.read(path, headers: true)
    data.each_with_index do |row, index|
      first_name = data[index]['first_name']
      last_name = data[index]['last_name']
      birthday = data[index]['birthday']
      email = data[index]['email']
      User.create(first_name: first_name, last_name: last_name, birthday: birthday, email: email)
    end
  end
end
