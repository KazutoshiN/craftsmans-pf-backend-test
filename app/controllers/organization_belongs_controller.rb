class OrganizationBelongsController < ApplicationController
  before_action :set_organization_belong, only: [:show, :update, :destroy]

  # GET /organization_belongs
  def index
    @organization_belongs = OrganizationBelong.all

    render json: @organization_belongs
  end

  # GET /organization_belongs/1
  def show
    render json: @organization_belong
  end

  # POST /organization_belongs
  def create
    @organization_belong = OrganizationBelong.new(organization_belong_params)

    if @organization_belong.save
      render json: @organization_belong, status: :created, location: @organization_belong
    else
      render json: @organization_belong.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /organization_belongs/1
  def update
    if @organization_belong.update(organization_belong_params)
      render json: @organization_belong
    else
      render json: @organization_belong.errors, status: :unprocessable_entity
    end
  end

  # DELETE /organization_belongs/1
  def destroy
    @organization_belong.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_belong
      @organization_belong = OrganizationBelong.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def organization_belong_params
      params.require(:organization_belong).permit(:user_id, :organization_id, :belong_type)
    end
end
