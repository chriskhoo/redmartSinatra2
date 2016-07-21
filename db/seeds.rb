require './models/user'

(0..10).each do |i|
  User.create(name: "User #{i}",
  email: "chuffy@email.com",
  address: "The edge of the universe",
  password: "1234",
  cc_number: "12341234123412")
end
