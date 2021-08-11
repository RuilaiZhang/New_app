class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :listings_features
  has_many :features, through: :listings_features, dependent: :destroy
  accepts_nested_attributes_for :listings_features
  enum condition: {Entry: 0, Easy: 1, Medium: 2, Hard: 3, Professional: 4}
  has_one_attached :picture

  before_save :remove_whitespace
  before_save :replace_nike
  before_validation :convert_price_to_cents, if: :price_changed?
  
  
  private
  
  def remove_whitespace 
    self.title = self.title.strip
    self.description = self.description.strip
  end 

  def replace_nike 
    self.title = self.title.gsub(/nike/i, "generic sports brand")
    self.description = self.description.gsub(/nike/i, "generic sports brand")
  end 

  def convert_price_to_cents 
    self.price = (self.attributes_before_type_cast["price"].to_f * 100).round
  end 
  
end