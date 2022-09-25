class AuthorsController < ApplicationController
  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create(author_params)
    if author.valid?
      #send back the error messages if the new author is invalid
      render json: author, status: :created
    else
      render json: { errors: author.errors }, status: :unprocessable_entity
    end
  end

  private

  def author_params
    params.permit(:email, :name)
  end
end
