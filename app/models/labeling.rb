# == Schema Information
#
# Table name: labelings
#
#  id             :integer          not null, primary key
#  label_id       :integer
#  labelable_id   :integer
#  labelable_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Labeling < ActiveRecord::Base
  belongs_to :labelable, polymorphic: true
  belongs_to :label
end
