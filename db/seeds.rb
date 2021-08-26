Xroot.create!([
  {title: "XRoot", synonym: "", description: "", code: "", version_date: "2021-05-05", publish: false, user_id: User.last.id}
])

Xcategory.create!([
  {title: "XCategory", synonym: "", description: "", code: "", version_date: "2021-08-05", publish: false, xroot_id: Xroot.last.id, user_id: User.last.id}
])

Xclass.create!([
  {title: "1A Xclass", synonym: nil, description: nil, code: "A", full_code: "1A", version_date: nil, publish: nil, xtype: nil, position: nil, ancestry: nil, ancestry_depth: 0, xcategory_id: Xcategory.last.id, user_id: User.last.id}
])

Xclass.create!([
  {title: "2B Xclass", synonym: nil, description: nil, code: "B", full_code: "2B", version_date: nil, publish: nil, xtype: nil, position: nil, parent_id: Xclass.first.id, ancestry_depth: 0, xcategory_id: Xcategory.last.id, user_id: User.last.id}
])

500.times do |index|
  Xclass.last.children.create!([
    {title: "#{index}C Xclass", synonym: nil, description: nil, code: "C", full_code: "#{index}C", version_date: nil, publish: nil, xtype: nil, position: nil, parent_id: Xclass.second.id, ancestry_depth: 0, xcategory_id: Xcategory.last.id, user_id: User.last.id}
  ])
end