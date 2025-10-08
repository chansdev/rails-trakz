class AutoresController < ApplicationController
  def index
    autores = Autore.all
    render json: autores
  end

  def show
    autor = Autore.find(params[:id])
    render json: autor
  end

  def create
    autor = Autore.new(autor_params)
    if autor.save
      render json: autor, status: :created
    else
      render json: { errors: autor.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    autor = Autore.find(params[:id])

    if autor.update(autor_params)
      render json: autor, status: :ok
    else
      render json: { errors: autor.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
  autor = Autore.find(params[:id])
  autor.destroy
  head :no_content
rescue ActiveRecord::RecordNotFound
  head :not_found
end

  private

  def autor_params
    params.require(:autor).permit(:name, :email)
  end
end