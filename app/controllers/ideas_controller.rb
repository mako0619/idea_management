class IdeasController < ApplicationController
  def index
    name = params[:category_name]
    if name.blank?
      @ideas = Idea.all
    else
      render status: :not_found and return unless Category.exists?(name: name)

      @ideas = Category.find_by(name: name).ideas
    end
    response = { data: idea_details }
    render json: response
  end

  def create
    name = params[:category_name]
    category = Category.exists?(name: name) ? Category.find_by(name: name) : Category.create(name: name)

    if Idea.new(category_id: category.id, body: params[:body]).save
      render status: :created
    else
      render status: :unprocessable_entity
    end
  end

  private

  def idea_details
    @ideas.map do |idea|
      {
        id: idea.id,
        category: idea.category.name,
        body: idea.body,
        created_at: idea.created_at.to_i
      }
    end
  end
end
