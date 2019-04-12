module Api
  module V1 
    class OrganizationRelationshipsController < ApplicationController
      before_action :set_organization_relationship, only: [:show, :update, :destroy]

      # GET /organization_relationships
      def index
        organization_relationship = OrganizationRelationship.all
        render json: { status: 'SUCCESS', message: 'loaded the organization_relationships', data: organization_relationship}
      end

      # GET /organization_relationships/1
      def show
        render json: { status: 'SUCCESS', message: 'loaded the organization_relationship', data: @organization_relationship}
      end

      # POST /organization_relationships
      def create
        @organization_relationship = OrganizationRelationship.new(organization_relationship_params)

        if @organization_relationship.save
          render json: { status: 'SUCCESS', message: 'loaded the organization_relationship', data: @organization_relationship}
        else
          render json: { status: 'ERROR', message: 'organization_relationship not saved', data: @organization_relationship.errors}
        end
      end

      # PATCH/PUT /organization_relationships/1
      def update
        if @organization_relationship.update(organization_relationship_params)
          render json: { status: 'SUCCESS', message: 'updated the organization_relationship', data: @organization_relationship}
        else
          render json: { status: 'SUCCESS', message: 'loaded the organization_relationship', data: @organization_relationship}
        end
      end

      # DELETE /organization_relationships/1
      def destroy
        @organization_relationship.destroy
        render json: { status: 'SUCCESS', message: 'deleted the organization_relationship', data: @organization_relationship}
      end

      def managed_craftsman
        organizations = Organization.find(params[:id]).from_organizations.order(:created_at)
        json = {"managed_craftsmans": []}
        organizations.each{ |organization|
          if(params[:type] == "collaborator" && organization.organization_relationship_type_id != 1)
            next
          end

          other_organization = Organization.find(organization.to_id)
          hash = {}
          users = []
          hash[:organization_id] = organization.to_id
          hash[:organization_name] = other_organization.name
          hash[:organization_type]= organization.organization_relationship_type_id
          other_organization.users.each{ |user|
            users.push({
              id: user.id,
              name: user.last_name,
              picture_url: user.picture_url,
            })
          }
          hash[:craftsmans] = users
          json[:managed_craftsmans].push(hash)
        }
        render json: { status: 'SUCCESS', message: 'deleted the organization_relationship', data: json}
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_organization_relationship
        @organization_relationship = OrganizationRelationship.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def organization_relationship_params
        params.require(:organization_relationship).permit(
          :from_id,
          :to_id,
          :organization_relationship_type_id
        )
      end
    end
  end
end
