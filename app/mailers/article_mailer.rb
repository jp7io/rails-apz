class ArticleMailer < ApplicationMailer

  def recommend(article, mail_to)
    @article = article
    mail(to: mail_to, subject: 'Article Recommendation')
  end

end
