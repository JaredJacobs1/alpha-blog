class ArticlesController < ApplicationController

  def show # show a particular article (see show.html.erb)
    @article = Article.find(params[:id])
  end

  def index # show all the articles (see index.html.erb)
    @arts = Article.all
  end

  def new # (1) show any errors which may have occurred in previous form submission
          # (2) make the form available again
    # 'new.html.erb' has the function of showing errors for the previous time someone 
    # attempted to create a new article in this session (see new.html.erb line 5). When
    # the user attempted to create an article, an @article instance param was created 
    # and its errors.full_messages is accessible from the @article instance var.
    # BUT, the first time through this action in this session, there is no @article 
    # instance param because there was no prior attempt to create an article IN THIS
    # SESSION. So, we create a happy @article here to make it available in the view 
    # and so that no error will occur when we attempt to access it.
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    #REQUIRE that a valid article object is present (we rec'd it here from the form)
    #Then, from the required article object, PERMIT access to the title and description.
    #Finally, create a new Article object in the @article instance variable
    @article = Article.new(params.require(:article).permit(:title, :description))

    # save the @article's data to the Articles table. If @article.save worked, then it
    # returns true and we are redirected to the 'show' action. If it failed, false is
    # returned and we are redirected to the 'new' action which will display the errors
    # that occurred and will display the title and description text entries.
    if @article.save

      #redirect to the 'show' article action we previously created in this controller, above.
      redirect_to @article # show the data stored in the just-saved article
    else
      # @article.save failed! So, return to the 'new' action to see the errors and try
      # again.
      render 'new' # Again, show the form to create an article
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was successfully updated."
      redirect_to @article #as in 'create' above, this sends us to the 'show' action
    else
      render 'edit'
    end
  end

  def destroy
    # the route requires this DELETE action to provide an Article id in the URL. It is
    # accessible, here, in the params array. @article gets the article object.
    @article = Article.find(params[:id])

    # now, delete the article
    @article.destroy

    # where do we want to go after the @article is destroyed? The listing page.
    redirect_to articles_path
  end

end