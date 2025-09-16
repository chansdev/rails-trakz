class ApiStatusController < ApplicationController
  def index
    render json: { status: 'ok', versao: '1.0' }
  end

  def show
    usuario = Usuario.find(params[:id])
    render json: usuario
  end
end

