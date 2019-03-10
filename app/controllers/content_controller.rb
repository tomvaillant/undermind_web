class ContentController < ApplicationController

  def create
    @content = Content.new(content_params)
    @content.save!
  end

  def index
    @client = Airtable::Client.new("keym68dki3Q2a3qZv")
    @table = @client.table("appTHjGm4xqid5XeY", "Bible")
    @records = @table.records
    @records_index = @table.select(Content_Type: "Videos").first(20)
    unless params[:search].nil?
      @search_params = params[:search].split(/\W+/)
      @content_list = Content.search(params[:search]).page(params[:page])
      if @content_list.empty?
        @content_search_empty = @records_index
      end
    else
      # @content_list = Content.search("Curiosity").page(params[:page])
      @content_list = @records_index
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

  def content_params
    params.require(:content).permit(:title, :url, :source, :medium, :category, :range)
  end
end
