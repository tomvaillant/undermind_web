class ContentController < ApplicationController
  def create
    @content = Content.new(content_params)
    @content.save!
  end

  def index
    if params[:search].present?
      @search_params = params[:search].split(/\W+/)
      @content_list = Content.search(params[:search])
    else
      @content_take = Content.take(50)
    end
  end

  # def edit
  #   @content = Content.find(params[:id])
  # end

  # def update
  #   @content = Content.find(params[:id])
  # end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy
  end

  def add_to_database
  end

  def content_params
    params.require(:content).permit(:title, :url, :source, :medium, :category, :range)
  end
end
