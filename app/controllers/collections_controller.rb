class CollectionsController < ApplicationController
  def index
    @collections = Collection.all
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    if @collection.save
      flash[:notice] = 'Collection added'
      redirect_to collections_path
    else
      flash[:alert] = 'Collection not added'
      render :new
    end
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:id])
    if @collection.update(collection_params)
      flash[:notice] = 'Collection updated'
      redirect_to collections_path
    else
      flash[:alert] = 'Collection not updated'
      render :edit
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    flash[:notice] = 'Collection removed'
    redirect_to collections_path
  end

  private
  def collection_params
    params.require(:collection).permit(:title)
  end



end
