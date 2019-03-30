module Api
  module V1 
    class SkillTypesController < ApplicationController
      before_action :set_skill_type, only: [:show, :update, :destroy]

      # GET /skill_types
      def index
        skill_type = SkillType.all
        render json: { status: 'SUCCESS', message: 'loaded the skill_types', data: skill_type}
      end

      # GET /skill_types/1
      def show
        render json: { status: 'SUCCESS', message: 'loaded the skill_type', data: @skill_type}
      end

      # POST /skill_types
      def create
        @skill_type = SkillType.new(skill_type_params)

        if @skill_type.save
          render json: { status: 'SUCCESS', message: 'loaded the skill_type', data: @skill_type}
        else
          render json: { status: 'ERROR', message: 'skill_type not saved', data: @skill_type.errors}
        end
      end

      # PATCH/PUT /skill_types/1
      def update
        if @skill_type.update(skill_type_params)
          render json: { status: 'SUCCESS', message: 'updated the skill_type', data: @skill_type}
        else
          render json: { status: 'SUCCESS', message: 'loaded the skill_type', data: @skill_type}
        end
      end

      # DELETE /skill_types/1
      def destroy
        @skill_type.destroy
        render json: { status: 'SUCCESS', message: 'deleted the skill_type', data: @skill_type}
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_skill_type
        @skill_type = SkillType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def skill_type_params
        params.require(:skill_type).permit(
          :code,
          :name,
          :sort_order
        )
      end
    end
  end
end
