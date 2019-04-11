module Api
  module V1 
    class SkillsController < ApplicationController
      before_action :set_skill, only: [:show, :update, :destroy]

      # GET /skills
      def index
        skill = Skill.all
        render json: { status: 'SUCCESS', message: 'loaded the skills', data: skill}
      end

      # GET /skills/1
      def show
        render json: { status: 'SUCCESS', message: 'loaded the skill', data: @skill}
      end

      # POST /skills
      def create
        @skill = Skill.new(skill_params)

        if @skill.save
          render json: { status: 'SUCCESS', message: 'loaded the skill', data: @skill}
        else
          render json: { status: 'ERROR', message: 'skill not saved', data: @skill.errors}
        end
      end

      # PATCH/PUT /skills/1
      def update
        if @skill.update(skill_params)
          render json: { status: 'SUCCESS', message: 'updated the skill', data: @skill}
        else
          render json: { status: 'SUCCESS', message: 'loaded the skill', data: @skill}
        end
      end

      # DELETE /skills/1
      def destroy
        @skill.destroy
        render json: { status: 'SUCCESS', message: 'deleted the skill', data: @skill}
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_skill
        @skill = Skill.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def skill_params
        params.require(:skill).permit(
          :skill_type_id,
          :skill_detail_type_id,
          :code,
          :name
        )
      end
    end
  end
end
