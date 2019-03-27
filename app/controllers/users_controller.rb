class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
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
        :employment_pattern_type_id,
        :has_injury_special_insurance,
        :health_insurance_type_id,
        :pension_type_id,
        :employment_insurance_type_id,
        :is_got_safe_education,
        :last_date_of_health_check
      )
    end
end
