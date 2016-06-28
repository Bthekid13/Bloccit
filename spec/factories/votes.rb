# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  value      :integer
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


FactoryGirl.define do
   factory :vote do
     value 1
   end
 end
