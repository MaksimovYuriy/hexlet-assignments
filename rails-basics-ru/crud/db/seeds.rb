require 'faker'

10.times do |index|
  Task.create(
    name: Faker::Lorem.word,
    description: Faker::Lorem.paragraph,
    creator: Faker::Name.unique.name
  )
end
