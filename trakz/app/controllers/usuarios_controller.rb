class UsuariosController < ApplicationController
  def index
    usuarios = Usuario.all
    render json: usuarios
  end
 
  def show
    usuario = Usuario.find(params[:id])
    render json: usuario
  end

  def create
    @usuario = Usuario.new(usuario_params)
    
    if @usuario.save
      render json: @usuario, status: :created
    else
      render json: { errors: @usuario.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @usuario = Usuario.find(params[:id])

    if @usuario.destroy
      render json: { message: 'Usuário deletado com sucesso' }, status: :ok
    else
      render json: { error: 'Erro ao deletar usuário' }, status: :unprocessable_entity
    end
  end

  def update
    @usuario = Usuario.find(params[:id])

    if @usuario.update(usuario_params)
      render json: @usuario
    else
      render json: { error: @usuario.errors.full_messages }, status: :unprocessable_entity
    end
  rescue => e
    render json: { error: e.message }, status: :internal_server_error
  end
 

  private

  def usuario_params
    params.require(:usuario).permit(:nome, :email)
  end
end