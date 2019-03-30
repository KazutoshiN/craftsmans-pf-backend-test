module Api
  module V1 
    class EmploymentInsuranceTypesController < ApplicationController
      before_action :set_employment_insurance_type, only: [:show, :update, :destroy]

      # GET /employment_insurance_types
      def index
        employment_insurance_type = EmploymentInsuranceType.all
        render json: { status: 'SUCCESS', message: 'loaded the employment_insurance_types', data: employment_insurance_type}
      end

      # GET /employment_insurance_types/1
      def show
        render json: { status: 'SUCCESS', message: 'loaded the employment_insurance_type', data: @employment_insurance_type}
      end

      # POST /employment_insurance_types
      def create
        @employment_insurance_type = EmploymentInsuranceType.new(employment_insurance_type_params)

        if @employment_insurance_type.save
          render json: { status: 'SUCCESS', message: 'loaded the employment_insurance_type', data: @employment_insurance_type}
        else
          render json: { status: 'ERROR', message: 'employment_insurance_type not saved', data: @employment_insurance_type.errors}
        end
      end

      # PATCH/PUT /employment_insurance_types/1
      def update
        if @employment_insurance_type.update(employment_insurance_type_params)
          render json: { status: 'SUCCESS', message: 'updated the employment_insurance_type', data: @employment_insurance_type}
        else
          render json: { status: 'SUCCESS', message: 'loaded the employment_insurance_type', data: @employment_insurance_type}
        end
      end

      # DELETE /employment_insurance_types/1
      def destroy
        @employment_insurance_type.destroy
        render json: { status: 'SUCCESS', message: 'deleted the employment_insurance_type', data: @employment_insurance_type}
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_employment_insurance_type
        @employment_insurance_type = EmploymentInsuranceType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def employment_insurance_type_params
        params.require(:employment_insurance_type).permit(
          :code,
          :name,
          :sort_order
        )
      end
    end
  end
end
