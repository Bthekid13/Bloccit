# == Schema Information
#
# Table name: labels
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


FactoryGirl.define do
   factory :label do
     name "L1"
   end
 end
