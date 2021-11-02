class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def show
    # puts params
    # logger.debug params[:id]
    @videos = Video.where(category_id: params[:id])
  end
end
