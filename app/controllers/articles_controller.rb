class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def index
    @arts = Article.all
  end

  def new
  end

  def create
    render plain: params[:article]
  end


end