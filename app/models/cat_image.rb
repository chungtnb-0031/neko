class CatImage < ApplicationRecord
	belongs_to :cat
  	validates :cat_id, presence: true
end
