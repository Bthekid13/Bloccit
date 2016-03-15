class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings

  validates :name, length: {minimum: 5}, presence: true
  validates :description, length: {minimum: 10}, presence: true


    def up_votes
      votes.where(value: 1).count
    end

    def down_votes
      votes.where(value: -1).count
    end

    def points
      votes.sum(:value)
    end


end
