class CatItem < ApplicationRecord
  belongs_to :cat
  belongs_to :cart
end
