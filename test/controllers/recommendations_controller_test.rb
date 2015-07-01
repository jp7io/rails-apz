require 'test_helper'

class RecommendationsControllerTest < ActionController::TestCase
  include ActiveJob::TestHelper

  setup do
    @article = articles(:one)
    @recommendation = Recommendation.new({
      article: @article,
      email: 'user@domain.local'
    })
    @recommendation_2 = Recommendation.new({
      article: @article,
      email: 'invalid_email_address'
    })
  end

  test "should get new" do
    get :new, article_id: @article.id
    assert_response :success
  end

  test "should not create recommendation with invalid email" do
    assert_enqueued_jobs 0 do
      post :create, article_id: @article.id, recommendation: {
        email: @recommendation_2.email,
        title: @recommendation_2.article
      }
    end

    assert_template :new
  end

  test "should create recommendation" do
    assert_enqueued_jobs 1 do
      post :create, article_id: @article.id, recommendation: {
        email: @recommendation.email,
        title: @recommendation.article
      }
    end

    assert_redirected_to articles_path
  end

end
