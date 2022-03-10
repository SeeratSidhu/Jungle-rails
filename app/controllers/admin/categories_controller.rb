class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV['BASIC_AUTH_USERNAME'], password: ENV['BASIC_AUTH_PASSWORD']

  def index
    @categories = Category.all
    puts @categories.inspect
  end

  def new
  end

  def create
  end
end
