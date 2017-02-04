class IndexController < ApplicationController
  def home
    @articles = Article.order(created_at: :desc).limit(5)
  end

  def about
  end

  def apps
  end

  def photos
  end

end
