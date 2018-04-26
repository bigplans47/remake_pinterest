class PostsController < ApplicationController
  def new
    @collection = Collection.find(params[:collection_id])
    @post = @collection.posts.new
  end

  def create
    @collection = Collection.find(params[:collection_id])
    @post = @collection.posts.new(post_params)
    if @post.save
      flash[:notice] = 'post added'
      redirect_to collection_path(@collection)
    else
      render :new
    end
  end

  # def index
  #   @collections = Collection.all
  # end

  def show
    # @collection = Collection.find(params[:post_id])
    @post = Post.find(params[:id])
  end

  def edit
    @collection = Collection.find(params[:collection_id])
    @post = Post.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:collection_id])
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = 'Editted post'
      redirect_to collection_path(@collection)
    else
      flash[:alert] = 'Post not editted please try again'
      # see if view below is right or if should be show
      render :edit
    end
  end

  def destroy
    @collection = Collection.find(params[:collection_id])
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to collection_path(@collection)
  end

  private
  def post_params
    params.require(:post).permit(:caption, :location)
  end

end
