class Product < ApplicationRecord

  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title, uniqueness: true, length: { minimum: 10, message: "は10文字以上でなければなりません。" }
  validates :image_url, allow_blank: true, format: {
    with:     %r{\.(gif|jpg|png)\z}i,
    message: 'はGIF、JPG、PNG画像のURLでなければなりません。'
  }
end
