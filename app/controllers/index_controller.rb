class IndexController < ApplicationController
  def home
    if logged_in?
      redirect_to articles_path
    end
  end

  def about
  end
end
