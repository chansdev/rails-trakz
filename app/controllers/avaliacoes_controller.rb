class AvaliacoesController < ApplicationController
  def index
    avaliacoes = Avaliacao.all
    render json: avaliacoes
  end

  def show
    avaliacao = Avaliacao.find(params[:id])
    render json: Avaliacao
  end

def create
  avaliacao = Avaliacao.new(avaliacao_params)
  if avaliacao.save
    render json: avaliacao, status: :created
  else
    render json: { errors: avaliacao.errors.full_messages }, status: :unprocessable_entity
  end
end
  

  def update
    avaliacao = Avaliacao.find(params[:id])

    if avaliacao.update(Avaliacao_params)
      render json: avaliacao, status: :ok
    else
      render json: { errors: avaliacao.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
  avaliacao = Avaliacao.find(params[:id])
  avaliacao.destroy
  head :no_content
rescue ActiveRecord::RecordNotFound
  head :not_found
end

  private

  def avaliacao_params
    params.require(:avaliacao).permit(:usuario_id, :musica_id, :comentario, :nota )
  end
end
