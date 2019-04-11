module Api
  module V1 
    class HealthInsuranceTypesController < ApplicationController
      before_action :set_health_insurance_type, only: [:show, :update, :destroy]

      # GET /health_insurance_types
      def index
        health_insurance_type = HealthInsuranceType.all
        render json: { status: 'SUCCESS', message: 'loaded the health_insurance_types', data: health_insurance_type}
      end

      # GET /health_insurance_types/1
      def show
        render json: { status: 'SUCCESS', message: 'loaded the health_insurance_type', data: @health_insurance_type}
      end

      # POST /health_insurance_types
      def create
        @health_insurance_type = HealthInsuranceType.new(health_insurance_type_params)

        if @health_insurance_type.save
          render json: { status: 'SUCCESS', message: 'loaded the health_insurance_type', data: @health_insurance_type}
        else
          render json: { status: 'ERROR', message: 'health_insurance_type not saved', data: @health_insurance_type.errors}
        end
      end

      # PATCH/PUT /health_insurance_types/1
      def update
        if @health_insurance_type.update(health_insurance_type_params)
          render json: { status: 'SUCCESS', message: 'updated the health_insurance_type', data: @health_insurance_type}
        else
          render json: { status: 'SUCCESS', message: 'loaded the health_insurance_type', data: @health_insurance_type}
        end
      end

      # DELETE /health_insurance_types/1
      def destroy
        @health_insurance_type.destroy
        render json: { status: 'SUCCESS', message: 'deleted the health_insurance_type', data: @health_insurance_type}
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_health_insurance_type
        @health_insurance_type = HealthInsuranceType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def health_insurance_type_params
        params.require(:health_insurance_type).permit(
          :code,
          :name,
          :sort_order
        )
      end
    end
  end
end
