class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def index
    @arts = Article.all
  end

end