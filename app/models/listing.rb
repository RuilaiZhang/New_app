class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :listings_features
  has_many :features, through: :listings_features
  accepts_nested_attributes_for :listings_features
  enum condition: {damaged: 0, poor: 1, good: 2, excellent: 3, mint: 4}
end
