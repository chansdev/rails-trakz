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
    user = Usuario.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    user = Usuario.find(params[:id])

    if user.update(user_params)
      render json: user, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    usuario = Usuario.find(params[:id])
    usuario.destroy
    head :no_content
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  def login
    user = Usuario.find_by(email: params[:email])

    if user && user.senha == params[:senha]
      render json: { message: "Login bem-sucedido", usuario: user }, status: :ok
    else
      render json: { error: "Email ou senha inválidos" }, status: :unauthorized
    end
  end


  private

  def user_params
    params.require(:user).permit(:nome, :email, :senha)
  end
end
