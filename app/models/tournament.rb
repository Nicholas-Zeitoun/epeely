class Tournament < ApplicationRecord
    has_many :poules, dependent: :destroy
end
