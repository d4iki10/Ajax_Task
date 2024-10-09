class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog

  def create
    @favorite = current_user.favorites.create(blog: @blog)
    @blog.reload
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
    @favorite.destroy if @favorite
    @blog.reload
    respond_to do |format|
      format.js
    end
  end

  private

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end
end
