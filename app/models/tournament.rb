class Tournament < ApplicationRecord
    has_many :poules, dependent: :destroy
    has_and_belongs_to_many :fencers, dependent: :nullify
end
