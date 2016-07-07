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
    title "yo captain whats good"
    body  "I have to fill this with text don't ya know"
    topic
    user
    rank 0.0
  end
end
