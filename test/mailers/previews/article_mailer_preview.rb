# Preview all emails at http://localhost:3000/rails/mailers/article_mailer
class ArticleMailerPreview < ActionMailer::Preview

  def recommend
    ArticleMailer.recommend(Article.first, 'debug@jp7.com.br')
  end

end
