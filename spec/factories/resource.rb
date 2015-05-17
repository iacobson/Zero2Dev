FactoryGirl.define do
  factory :resource do
    content "Neque porro quisquam est qui dolorem ipsum"
    #association" resource belogns_to user
    user
  end
end
