class V1::StatusChangeEventController < ApplicationController
  before_action :set_record, only: [:show, :update, :destroy]

  # GET /records
  def index
    @records = nil
    if params[:issue_id].present?
      @records = StatusChangeEvent.where(issue_id: params[:issue_id])
    else
      @records = StatusChangeEvent.all
    end

    render json: @records
  end

  # GET /records/1
  def show
    render json: @record
  end

  # POST /records
  def create
    @record = StatusChangeEvent.new(allowed_params)

    if @record.save
      render json: @record, status: :created
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /records/1
  def update
    if @record.update(record_params)
      render json: @record
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  # DELETE /records/1
  def destroy
    @record.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = StatusChangeEvent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def record_params
      params.fetch(:record, {})
    end

    def allowed_params
      params.permit(
        :id, :issue_id, :project_type,
        :project_name, :property_name, :client_name,
        :status, :status_started_at, :status_completed_at,
        :next_status, :action_user_id, :action_user_name,
        :order_price, :project_started_at, :project_completed_at, :comment
      )
    end  

=begin
  def index
    render json: {hello: "world"}
  end

  def show
    render json: {hello: "show"}
  end
=end
end
