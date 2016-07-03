# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  topic_id   :integer
#  user_id    :integer
#  rank       :float
#

include RandomData

FactoryGirl.define do
  factory :post do
    title RandomData.random_sentence
    body  RandomData.random_paragraph
    topic
    user
    rank 0.0
  end
end
