module Api
  module V1 
    class UsersController < ApplicationController
      before_action :set_user, only: [:show, :update, :destroy]

      # GET /users
      def index
        user = User.all
        render json: { status: 'SUCCESS', message: 'loaded the users', data: user}
      end

      # GET /users/1
      def show
        render json: { status: 'SUCCESS', message: 'loaded the user', data: @user}
      end

      # POST /users
      def create
        @user = User.new(user_params)

        if @user.save
          render json: { status: 'SUCCESS', message: 'loaded the user', data: @user}
        else
          render json: { status: 'ERROR', message: 'user not saved', data: @user.errors}
        end
      end

      # PATCH/PUT /users/1
      def update
        if @user.update(user_params)
          render json: { status: 'SUCCESS', message: 'updated the user', data: @user}
        else
          render json: { status: 'SUCCESS', message: 'loaded the user', data: @user}
        end
      end

      # DELETE /users/1
      def destroy
        @user.destroy
        render json: { status: 'SUCCESS', message: 'deleted the user', data: @user}
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def user_params
        params.require(:user).permit(
          :last_name,
          :last_name_kana,
          :first_name,
          :first_name_kana,
          :gender,
          :birth_date,
          :blood_type_id,
          :address,
          :address_building_name,
          :picture_url,
          :address_urgent,
          :name_urgent,
          :phone_urgent,
          :relationship_urgent,
          :organization_joined_date,
          :working_yesr_construction,
          :working_yesr_current_work,
          :is_receive_employment_agreement,
          :has_injury_special_insurance,
          :health_insurance_type_id,
          :pension_type_id,
          :employment_insurance_type_id,
          :is_got_safe_education,
          :last_date_of_health_check
        )
      end
    end
  end
end
