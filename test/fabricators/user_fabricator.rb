Fabricator(:user) do
  username { Faker::Lorem.word }
  new_password { Faker::Lorem.word }
end