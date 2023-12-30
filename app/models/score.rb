class Score < ApplicationRecord
    belongs_to :match
    belongs_to :fencer
end
