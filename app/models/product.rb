class Product < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one_attached :photo
  validates_presence_of :code, :name, :description, :price

  def to_preference_item
    {
      id: code,
      title: name,
      description:,
      unit_price: price,
      quantity: 1,
      picture_url: rails_blob_url(photo)
    }
  end
end
