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

class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings

  validates :name, length: {minimum: 5}, presence: true
  validates :description, length: {minimum: 10}, presence: true

  scope :visible_to, -> (user) { user ? all : where(public: true) }


end
