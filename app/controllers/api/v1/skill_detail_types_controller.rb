module Api
  module V1 
    class SkillDetailTypesController < ApplicationController
      before_action :set_skill_detail_type, only: [:show, :update, :destroy]

      # GET /skill_detail_types
      def index
        skill_detail_type = SkillDetailType.all
        render json: { status: 'SUCCESS', message: 'loaded the skill_detail_types', data: skill_detail_type}
      end

      # GET /skill_detail_types/1
      def show
        render json: { status: 'SUCCESS', message: 'loaded the skill_detail_type', data: @skill_detail_type}
      end

      # POST /skill_detail_types
      def create
        @skill_detail_type = SkillDetailType.new(skill_detail_type_params)

        if @skill_detail_type.save
          render json: { status: 'SUCCESS', message: 'loaded the skill_detail_type', data: @skill_detail_type}
        else
          render json: { status: 'ERROR', message: 'skill_detail_type not saved', data: @skill_detail_type.errors}
        end
      end

      # PATCH/PUT /skill_detail_types/1
      def update
        if @skill_detail_type.update(skill_detail_type_params)
          render json: { status: 'SUCCESS', message: 'updated the skill_detail_type', data: @skill_detail_type}
        else
          render json: { status: 'SUCCESS', message: 'loaded the skill_detail_type', data: @skill_detail_type}
        end
      end

      # DELETE /skill_detail_types/1
      def destroy
        @skill_detail_type.destroy
        render json: { status: 'SUCCESS', message: 'deleted the skill_detail_type', data: @skill_detail_type}
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_skill_detail_type
        @skill_detail_type = SkillDetailType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def skill_detail_type_params
        params.require(:skill_detail_type).permit(
          :code,
          :name,
          :sort_order
        )
      end
    end
  end
end
