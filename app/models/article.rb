class Article < ActiveRecord::Base
  belongs_to :author

  validates :title, presence: true, length: {
    minimum: 10,
    maximum: 100,
  }
  validates :content, presence: true, length: {
    minimum: 10,
    maximum: 1000,
  }

end
