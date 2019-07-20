class Institution < ApplicationRecord
	has_many :user_institutions
	has_many :users, :through => :user_institutions
end
