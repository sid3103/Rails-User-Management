class Role < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	has_one :assignment  
	has_one :user, through: :assignment
end
