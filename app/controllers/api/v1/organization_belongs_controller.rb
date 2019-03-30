module Api
  module V1 
    class OrganizationBelongsController < ApplicationController
      before_action :set_organization_belong, only: [:show, :update, :destroy]

      # GET /organization_belongs
      def index
        organization_belong = OrganizationBelong.all
        render json: { status: 'SUCCESS', message: 'loaded the organization_belongs', data: organization_belong}
      end

      # GET /organization_belongs/1
      def show
        render json: { status: 'SUCCESS', message: 'loaded the organization_belong', data: @organization_belong}
      end

      # POST /organization_belongs
      def create
        @organization_belong = OrganizationBelong.new(organization_belong_params)

        if @organization_belong.save
          render json: { status: 'SUCCESS', message: 'loaded the organization_belong', data: @organization_belong}
        else
          render json: { status: 'ERROR', message: 'organization_belong not saved', data: @organization_belong.errors}
        end
      end

      # PATCH/PUT /organization_belongs/1
      def update
        if @organization_belong.update(organization_belong_params)
          render json: { status: 'SUCCESS', message: 'updated the organization_belong', data: @organization_belong}
        else
          render json: { status: 'SUCCESS', message: 'loaded the organization_belong', data: @organization_belong}
        end
      end

      # DELETE /organization_belongs/1
      def destroy
        @organization_belong.destroy
        render json: { status: 'SUCCESS', message: 'deleted the organization_belong', data: @organization_belong}
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_organization_belong
        @organization_belong = OrganizationBelong.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def organization_belong_params
        params.require(:organization_belong).permit(:user_id, :organization_id, :employment_pattern_type_id, :permission_type_id)
      end
    end
  end
end
