module Api
  module V1 
    class EmploymentPatternTypesController < ApplicationController
      before_action :set_employment_pattern_type, only: [:show, :update, :destroy]

      # GET /employment_pattern_types
      def index
        employment_pattern_type = EmploymentPatternType.all
        render json: { status: 'SUCCESS', message: 'loaded the employment_pattern_types', data: employment_pattern_type}
      end

      # GET /employment_pattern_types/1
      def show
        render json: { status: 'SUCCESS', message: 'loaded the employment_pattern_type', data: @employment_pattern_type}
      end

      # POST /employment_pattern_types
      def create
        @employment_pattern_type = EmploymentPatternType.new(employment_pattern_type_params)

        if @employment_pattern_type.save
          render json: { status: 'SUCCESS', message: 'loaded the employment_pattern_type', data: @employment_pattern_type}
        else
          render json: { status: 'ERROR', message: 'employment_pattern_type not saved', data: @employment_pattern_type.errors}
        end
      end

      # PATCH/PUT /employment_pattern_types/1
      def update
        if @employment_pattern_type.update(employment_pattern_type_params)
          render json: { status: 'SUCCESS', message: 'updated the employment_pattern_type', data: @employment_pattern_type}
        else
          render json: { status: 'SUCCESS', message: 'loaded the employment_pattern_type', data: @employment_pattern_type}
        end
      end

      # DELETE /employment_pattern_types/1
      def destroy
        @employment_pattern_type.destroy
        render json: { status: 'SUCCESS', message: 'deleted the employment_pattern_type', data: @employment_pattern_type}
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_employment_pattern_type
        @employment_pattern_type = EmploymentPatternType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def employment_pattern_type_params
        params.require(:employment_pattern_type).permit(
          :code,
          :name,
          :sort_order
        )
      end
    end
  end
end
