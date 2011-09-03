class Product < ActiveRecord::Base
=begin
  validates :title, :image_url, :description, presence => true
  validates :price, numericality: {greter_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
      with:   %r{\.(gif|jpg|png)$}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
  }
=end
end
