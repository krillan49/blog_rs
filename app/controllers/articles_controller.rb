class ArticlesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  # before_action :owner?, only: %i[edit destroy]
  
  def index
    @articles = Article.all
  end

  def new
  end
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render action: 'new'
    end 
  end

  def show 
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
    owner?
  end
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render action: 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    owner?
    @article.destroy 
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :user_id)
  end

  def owner?
    unless current_user == @article.user
      redirect_back fallback_location: root_path, notice: 'User is not owner'
    end
  end
end
