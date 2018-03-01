class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_categories

  private
  def set_categories
    @categories = Category.all.order(:name)
  end
end
