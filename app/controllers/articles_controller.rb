class ArticlesController < ApplicationController

  def show
    # 'show' has the function of showing errors for the last time someone attempted to
    # create a new article. In those cases, an @article instance param has been created 
    # and its errors.full_messages is displayed in the view.
    # BUT, the first time through 'show', there is no @article instance param because
    # it is the first time though 'articles'. So, we create a happy @article here to
    # make it available in the view so that no error will occur.
    @article = Article.find(params[:id])
  end

  def index
    @arts = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    #REQUIRE that a valid article object is present (we rec'd it here from the form)
    #Then, from the required article object, PERMIT access to the title and description.
    #Finally, create a new Article object in the @article instance variable
    @article = Article.new(params.require(:article).permit(:title, :description))

    #save the @article's data to the Articles table. If @article.save worked, then it
    #returns true. If it failed, false.
    if @article.save

      #redirect to the 'show' article action we previously created in this controller, above.
      redirect_to @article 
    else

      #@article.save failed! So, return to the 'new' action
      render 'new'
    end
  end

end