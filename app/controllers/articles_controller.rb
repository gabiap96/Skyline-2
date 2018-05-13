# articles controller
class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])

    if @article.destroy
      redirect_to user_profile_path(current_user.username)
    else
      redirect_to error_path('The article could not be deleted')
    end
  end

  def create
    @article = Article.new(article_params)

    # no other user should be able to make articles for this user
    @article.user = current_user

    if @article.save
      redirect_to @article
    else
      render '/error'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :user_id, :intro)
  end

end