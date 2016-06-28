# == Schema Information
#
# Table name: topics
#
#  id          :integer          not null, primary key
#  name        :string
#  public      :boolean          default(TRUE)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

include RandomData

FactoryGirl.define do
  factory :topic do
    name RandomData.random_name
    description RandomData.random_sentence
  end
end
