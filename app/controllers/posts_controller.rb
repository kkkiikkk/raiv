class PostsController < ApplicationController
  def index
    @posts = Post.newest
    @categories = Category.all
    if params[:search].present?
      sanitized_search = Post.sanitize_sql_like(params[:search])
      @posts = @posts.i18n do
        title.matches("%#{sanitized_search}%")
      end
    end

    if params[:year].present?
      @posts = @posts.filter_by_year(params[:year])
    end
  end

  def show
    @post = Post.friendly.find(params[:id])
  end
end
