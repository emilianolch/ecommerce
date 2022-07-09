class Product < ApplicationRecord
  has_one_attached :photo
  validates_presence_of :code, :name, :description, :price, :photo
end
