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
<<<<<<< HEAD
    body RandomData.random_paragraph
=======
    body  RandomData.random_paragraph
>>>>>>> fedacbc646599728313cea0423e1c345a7bb5bc3
    topic
    user
    rank 0.0
  end
end
