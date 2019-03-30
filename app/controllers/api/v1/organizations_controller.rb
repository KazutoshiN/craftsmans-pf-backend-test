module Api
  module V1 
    class OrganizationsController < ApplicationController
      before_action :set_organization, only: [:show, :update, :destroy]

      # GET /organizations
      def index
        organization = Organization.all
        render json: { status: 'SUCCESS', message: 'loaded the organizations', data: organization}
      end

      # GET /organizations/1
      def show
        render json: { status: 'SUCCESS', message: 'loaded the organization', data: @organization}
      end

      # POST /organizations
      def create
        @organization = Organization.new(organization_params)

        if @organization.save
          render json: { status: 'SUCCESS', message: 'loaded the organization', data: @organization}
        else
          render json: { status: 'ERROR', message: 'organization not saved', data: @organization.errors}
        end
      end

      # PATCH/PUT /organizations/1
      def update
        if @organization.update(organization_params)
          render json: { status: 'SUCCESS', message: 'updated the organization', data: @organization}
        else
          render json: { status: 'SUCCESS', message: 'loaded the organization', data: @organization}
        end
      end

      # DELETE /organizations/1
      def destroy
        @organization.destroy
        render json: { status: 'SUCCESS', message: 'deleted the organization', data: @organization}
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_organization
        @organization = Organization.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def organization_params
        params.require(:organization).permit(
          :name,
          :shortname,
          :postal_code,
          :address,
          :address_building_name,
          :logo_url
        )
      end
    end
  end
end
