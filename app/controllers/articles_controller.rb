class ArticlesController < ApplicationController
  before_action :set_article, only: [ :update, :show, :edit, :destroy ]
  before_action :authenticate_user, except: [ :index, :show ]
  before_action :same_user, only: [ :update, :destroy ]


  def index
    @articles = Article.all
  end

  def new
    if !admin?
      redirect_to articles_path
    end
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article has been created"
      redirect_to articles_path
    else
      flash.now[:danger] = "Article has not been created!"
      render "new"
    end
  end

  def edit
    if !admin?
      redirect_to articles_path
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
    @comments = @article.comments
    @comment = @article.comments.build
  end

  def destroy
    if admin?
      @article.destroy
      flash[ :notice ] = "Article #{@article.title} Deleted!"
    end
      redirect_to articles_path
  end

  protected;
  def resource_not_found
    message = "This is not the article you are looking for"
    flash[:alert] = message
    redirect_to root_path
  end

  private;
  def article_params
    params.require(:article).permit(:title, :body)
  end

  private;
  def set_article
    @article = Article.find(params[:id])
  end

  private;
  def same_user
    if @article.user != current_user
      flash[:danger] = "You cannot change other writers' articles"
      redirect_to root_path
    end
  end

end
