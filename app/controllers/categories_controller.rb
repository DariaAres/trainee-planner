# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_category, only: %i[edit update destroy]

  def index
    @categories = current_user.categories.all.page(params[:page]).per(params[:per_page]).order(:name)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.create(category_params)

    if Category.all.exists?(@category.id)
      redirect_to categories_path, notice: t('category.category_created')
    else
      render :new, status: :unprocessable_entity, notice: t('category.category_not_created')
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: t('category.category_updated')
    else
      render :edit, status: :unprocessable_entity, notice: t('category.category_not_updated')
    end
  end

  def destroy
    if @category.destroy
      redirect_to categories_path, status: :see_other, notice: t('category.category_deleted')
    else
      redirect_to categories_path, status: :see_other, notice: t('category.category_not_deleted')
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
