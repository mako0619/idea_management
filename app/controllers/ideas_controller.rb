class IdeasController < ApplicationController
  def create
    name = params[:category_name]
    category = Category.exists?(name: name) ? Category.find_by(name: name) : Category.create(name: name)

    if Idea.new(category_id: category.id, body: params[:body]).save
      render status: :created
    else
      render status: :unprocessable_entity
    end
  end
end
