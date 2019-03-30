module Api
  module V1 
    class AttachmentsController < ApplicationController
      before_action :set_attachment, only: [:show, :update, :destroy]

      # GET /attachments
      def index
        attachment = Attachment.all
        render json: { status: 'SUCCESS', message: 'loaded the attachments', data: attachment}
      end

      # GET /attachments/1
      def show
        render json: { status: 'SUCCESS', message: 'loaded the attachment', data: @attachment}
      end

      # POST /attachments
      def create
        @attachment = Attachment.new(attachment_params)

        if @attachment.save
          render json: { status: 'SUCCESS', message: 'loaded the attachment', data: @attachment}
        else
          render json: { status: 'ERROR', message: 'attachment not saved', data: @attachment.errors}
        end
      end

      # PATCH/PUT /attachments/1
      def update
        if @attachment.update(attachment_params)
          render json: { status: 'SUCCESS', message: 'updated the attachment', data: @attachment}
        else
          render json: { status: 'SUCCESS', message: 'loaded the attachment', data: @attachment}
        end
      end

      # DELETE /attachments/1
      def destroy
        @attachment.destroy
        render json: { status: 'SUCCESS', message: 'deleted the attachment', data: @attachment}
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_attachment
        @attachment = Attachment.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def attachment_params
        params.require(:attachment).permit(
          :filename,
          :url
        )
      end
    end
  end
end
