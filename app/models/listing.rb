class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  enum condition: {damaged: 0, poor: 1, good: 2, excellent: 3, mint: 4}
end
