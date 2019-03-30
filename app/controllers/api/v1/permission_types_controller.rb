module Api
  module V1 
    class PermissionTypesController < ApplicationController
      before_action :set_permission_type, only: [:show, :update, :destroy]

      # GET /permission_types
      def index
        permission_type = PermissionType.all
        render json: { status: 'SUCCESS', message: 'loaded the permission_types', data: permission_type}
      end

      # GET /permission_types/1
      def show
        render json: { status: 'SUCCESS', message: 'loaded the permission_type', data: @permission_type}
      end

      # POST /permission_types
      def create
        @permission_type = PermissionType.new(permission_type_params)

        if @permission_type.save
          render json: { status: 'SUCCESS', message: 'loaded the permission_type', data: @permission_type}
        else
          render json: { status: 'ERROR', message: 'permission_type not saved', data: @permission_type.errors}
        end
      end

      # PATCH/PUT /permission_types/1
      def update
        if @permission_type.update(permission_type_params)
          render json: { status: 'SUCCESS', message: 'updated the permission_type', data: @permission_type}
        else
          render json: { status: 'SUCCESS', message: 'loaded the permission_type', data: @permission_type}
        end
      end

      # DELETE /permission_types/1
      def destroy
        @permission_type.destroy
        render json: { status: 'SUCCESS', message: 'deleted the permission_type', data: @permission_type}
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_permission_type
        @permission_type = PermissionType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def permission_type_params
        params.require(:permission_type).permit(
          :code,
          :name,
          :sort_order
        )
      end
    end
  end
end
