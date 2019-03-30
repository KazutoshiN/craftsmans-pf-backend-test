module Api
  module V1 
    class PensionTypesController < ApplicationController
      before_action :set_pension_type, only: [:show, :update, :destroy]

      # GET /pension_types
      def index
        pension_type = PensionType.all
        render json: { status: 'SUCCESS', message: 'loaded the pension_types', data: pension_type}
      end

      # GET /pension_types/1
      def show
        render json: { status: 'SUCCESS', message: 'loaded the pension_type', data: @pension_type}
      end

      # POST /pension_types
      def create
        @pension_type = PensionType.new(pension_type_params)

        if @pension_type.save
          render json: { status: 'SUCCESS', message: 'loaded the pension_type', data: @pension_type}
        else
          render json: { status: 'ERROR', message: 'pension_type not saved', data: @pension_type.errors}
        end
      end

      # PATCH/PUT /pension_types/1
      def update
        if @pension_type.update(pension_type_params)
          render json: { status: 'SUCCESS', message: 'updated the pension_type', data: @pension_type}
        else
          render json: { status: 'SUCCESS', message: 'loaded the pension_type', data: @pension_type}
        end
      end

      # DELETE /pension_types/1
      def destroy
        @pension_type.destroy
        render json: { status: 'SUCCESS', message: 'deleted the pension_type', data: @pension_type}
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_pension_type
        @pension_type = PensionType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def pension_type_params
        params.require(:pension_type).permit(
          :code,
          :name,
          :sort_order
        )
      end
    end
  end
end
