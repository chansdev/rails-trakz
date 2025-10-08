class SeguidasController < ApplicationController
  def index
    seguidas = Seguida.all
    render json: seguidas
  end

  def show
    seguida = Seguida.find(params[:id])
    render json: seguida
  end

  def create
    seguida = Seguida.new(user_params)
    if seguida.save
      render json: seguida, status: :created
    else
      render json: { errors: seguida.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    seguida = Seguida.find(params[:id])

    if seguida.update(seguida_params)
      render json: seguida, status: :ok
    else
      render json: { errors: seguida.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
  seguida = Seguida.find(params[:id])
  seguida.destroy
  head :no_content
rescue ActiveRecord::RecordNotFound
  head :not_found
end

  private

  def seguida_params
    params.require(:seguida).permit(:name, :email)
  end
end
