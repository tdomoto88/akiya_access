class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.where(user: current_user)
    @properties = Property.where(user: current_user)
  end

  def new
    @property = Property.find(params[:property_id])
    @consultation = Consultation.new
  end

  def create
    @consultation = Consultation.new(consultation_params)
    @property = Property.find(params[:property_id])
    @consultation.property = @property
    @consultation.user = current_user
    @consultation.save
    redirect_to property_consultations_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def consultation_params
    params.require(:consultation).permit(:date, :user_id, :property_id)
  end
end
