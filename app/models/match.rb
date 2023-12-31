class Match < ApplicationRecord
    belongs_to :poule
    has_many :scores, dependent: :destroy
    has_many :fencers, through: :scores
end
