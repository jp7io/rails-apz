class Recommendation
  include ActiveModel::Model
  attr_accessor :article, :email
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  def send?
    ArticleMailer.recommend(article, email).deliver_later
  end
end
