class MusicaController < ApplicationController 
  def index
    musicas = Musica.all
    render json: musicas
  end

  def show
    musica = Musica.find(params[:id])
    render json: musica
  end

  def create
    musica = Musica.new(musica_params)
    if musica.save
      render json: musica, status: :created
    else
      render json: { errors: musica.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    musica = Musica.find(params[:id])

    if musica.update(musica_params)
      render json: musica, status: :ok
    else
      render json: { errors: musica.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
  musica = Musica.find(params[:id])
  musica.destroy
  head :no_content
rescue ActiveRecord::RecordNotFound
  head :not_found
end

  private

  def musica_params
    params.require(:musica).permit(:name, :email)
  end
end
