# frozen_string_literal: true

3.times do
  Xroot.create({ title: Faker::Address.city, user_id: User.first.id })

  3.times do
    Xcategory.create({ title: Faker::Ancient.god, xroot_id: Xroot.last.id, user_id: User.first.id })

    3.times do
      Xclass.create({ title: Faker::App.name, full_code: Faker::Alphanumeric.alpha(number: 10),
                      xcategory_id: Xcategory.last.id, user_id: User.first.id })
    end
  end
end

500.times do
  Xclass.create({ title: Faker::Beer.brand, full_code: Faker::Alphanumeric.alpha(number: 20),
                  parent_id: Xclass.first.id, xcategory_id: Xcategory.last.id, user_id: User.first.id })
end

500.times do
  Xclass.create({ title: Faker::Beer.brand, full_code: Faker::Alphanumeric.alpha(number: 20),
                  parent_id: Xclass.second.id, xcategory_id: Xcategory.last.id, user_id: User.first.id })
end

500.times do
  Xclass.create({ title: Faker::Beer.brand, full_code: Faker::Alphanumeric.alpha(number: 20),
                  parent_id: Xclass.last.id, xcategory_id: Xcategory.last.id, user_id: User.first.id })
end
