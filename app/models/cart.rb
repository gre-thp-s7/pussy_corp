class Cart < ApplicationRecord
  belongs_to :user, presence: true
  belongs_to :product
  belongs_to :order
end
