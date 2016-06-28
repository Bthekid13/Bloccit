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

require 'rails_helper'

RSpec.describe Labeling, type: :model do

  describe "associations" do
    it { is_expected.to belong_to :labelable }
  end
end
