


class UsuariosController < ApplicationController
  def index
    usuarios = Usuario.all
    render json: usuarios
  end
 
  def show
    usuario = Usuario.find(params[:id])
    render json: usuario
  end
end

def create 
  usuario = Usuario.new(usuario_params)
if usuario.save
  render json: usuario, status: :created
else
  render json: usuario, status: :unprocessable_entity
end
end

private

def usuario_params
  params.require(:usuario).permit(:nome, :email)
end