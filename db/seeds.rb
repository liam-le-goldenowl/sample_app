User.create(
  name: 'admin',
  email: 'admin@gmail.com',
  password: '11111111',
  password_confirmation: '111111111',
  admin: true
)

99.times do |n|
  name = Faker::Name.name
  email = "exp#{n+1}@gmail.com"
  password = '11111111'
  User.create(
    name: name,
    email: email,
    password: password,
    password_confirmation: password
  )
end
