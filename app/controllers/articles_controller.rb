class ArticlesController < ApplicationController
  before_action :set_article, only: [ :update, :show, :edit, :destroy ]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article has been created"
      redirect_to articles_path
    else
      flash.now[:danger] = "Article has not been created!"
      render "new"
    end
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article has been updated"
      redirect_to articles_path
    else
      flash.now[:danger] = "Article has not been updated!"
      render "edit"
    end

  end

  def show
  end

  def destroy
    @article.destroy
    flash[ :notice ] = "Article #{@article.title} Deleted!"
    redirect_to articles_path
  end

  def edit
  end

  private;
  def article_params
    params.require(:article).permit(:title, :body)
  end

  private;
  def set_article
    @article = Article.find(params[:id])
  end
end
