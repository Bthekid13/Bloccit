# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

include RandomData

FactoryGirl.define do
   factory :comment do
     body RandomData.random_paragraph
     post
     user
   end
 end
