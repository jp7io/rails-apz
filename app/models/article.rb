class Article < ActiveRecord::Base

  validates :title, presence: true, length: {
    minimum: 10,
    maximum: 100,
  }
  validates :content, presence: true, length: {
    minimum: 10,
    maximum: 1000,
  }

end
