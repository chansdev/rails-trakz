class CurtidasController < ApplicationController
    def index
        curtidas = Curtida.all
        render json: curtidas
      end
    
      def show
        curtida = Curtida.find(params[:id])
        render json: curtida
      end
    
      def create
        curtida = Curtida.new(curtida_params)
        if curtida.save
          render json: curtida, status: :created
        else
          render json: { errors: curtida.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      def update
        curtida = Curtida.find(params[:id])
    
        if curtida.update(curtida_params)
          render json: curtida, status: :ok
        else
          render json: { errors: curtida.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      def destroy
      curtida = Curtida.find(params[:id])
      curtida.destroy
      head :no_content
    rescue ActiveRecord::RecordNotFound
      head :not_found
    end
    
      private
    
      def curtida_params
        params.require(:curtida).permit(:usuario_id, :avaliacao_id)
      end
end
