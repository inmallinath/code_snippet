# Key things to remember is that factories should always provide a set of valid attributes, which means factories should always create a record with no validation errors
FactoryGirl.define do
  factory :kind do
    language {["Ruby", "Javascript"].sample}
  end

end
