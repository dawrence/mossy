module Api
  class CategoriesController < ApplicationController

    def index
      @categories = model.where(sale_point_id: query_params[:sale_point_id])
      if @categories.size.positive?
        render json: { categories: @categories }
      else
        render json: { errors: 'Unknown Sale Point' },
               status: :unprocessable_entity
      end
    end

    def create
      @category = model.new(create_params)
      if category.save
        render json: category
      else
        render json: errors, status: :unprocessable_entity
      end
    end

    def update
      if category.update(update_params)
        render json: category
      else
        render json: errors, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: e.message, status: :not_found
    end

    def show
      if category
        render json: category
      else
        render json: errors, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: e.message, status: :not_found
    end

    private

    def errors
      { errors: category.errors.full_messages }
    end

    def category
      @category ||= model.find_by!(
        id: query_params[:id],
        sale_point_id: query_params[:sale_point_id]
      )
    end

    def update_params
      params.require(:category)
        .permit(:name, :description, :published_at,
                :published_until, :published)
    end

    def query_params
      params.permit(:id, :sale_point_id)
    end

    def create_params
      params.require(:category)
        .permit(:id, :sale_point_id, :name, :description, :published_at,
                :published_until, :published)
    end

    def model
      ::Category
    end
  end
end
