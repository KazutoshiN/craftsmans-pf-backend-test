module Api
  module V1 
    class BloodTypesController < ApplicationController
      before_action :set_blood_type, only: [:show, :update, :destroy]

      # GET /blood_types
      def index
        blood_type = BloodType.all
        render json: { status: 'SUCCESS', message: 'loaded the blood_types', data: blood_type}
      end

      # GET /blood_types/1
      def show
        render json: { status: 'SUCCESS', message: 'loaded the blood_type', data: @blood_type}
      end

      # POST /blood_types
      def create
        @blood_type = BloodType.new(blood_type_params)

        if @blood_type.save
          render json: { status: 'SUCCESS', message: 'loaded the blood_type', data: @blood_type}
        else
          render json: { status: 'ERROR', message: 'blood_type not saved', data: @blood_type.errors}
        end
      end

      # PATCH/PUT /blood_types/1
      def update
        if @blood_type.update(blood_type_params)
          render json: { status: 'SUCCESS', message: 'updated the blood_type', data: @blood_type}
        else
          render json: { status: 'SUCCESS', message: 'loaded the blood_type', data: @blood_type}
        end
      end

      # DELETE /blood_types/1
      def destroy
        @blood_type.destroy
        render json: { status: 'SUCCESS', message: 'deleted the blood_type', data: @blood_type}
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_blood_type
        @blood_type = BloodType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def blood_type_params
        params.require(:blood_type).permit(
          :code,
          :name,
          :sort_order
        )
      end
    end
  end
end
