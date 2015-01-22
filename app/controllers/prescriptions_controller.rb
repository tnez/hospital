class PrescriptionsController < ApplicationController

  def show
    @prescription = Prescription.find params[:id]
    @patient = @prescription.patient
  end
  
  def new
    @patient = Patient.find params[:patient_id]
    @prescription = @patient.prescriptions.new
  end

  def create
    @patient = Patient.find params[:patient_id]
    if @patient.prescriptions.create prescription_params
      flash[:notice] = "Prescription was successfully created"
      redirect_to patient_path(@patient)
    else
      flash[:alert] = 'There was a problem: Prescription could not be saved!'
      render :new
    end
  end

  def edit
    @prescription = Prescription.find params[:id]
    @patient = @prescription.patient
  end

  def update
    @prescription = Prescription.find params[:id]
    @patient = @prescription.patient
    if @prescription.update prescription_params
      flash[:notice] = 'Prescription was successfully saved'
      redirect_to patient_path(@patient)
    else
      flash[:alert] = 'There was a problem: Prescription could not be saved!'
      render :edit
    end
  end

  def destroy
    @prescription = Prescription.find params[:id]
    @patient = @prescription.patient
    if @prescription.destroy
      flash[:notice] = 'Prescription was deleted'
      redirect_to patient_path(@patient)
    else
      flash[:alert] = 'There was a problem: Prescription could not be deleted!'
      redirect_to patient_path(@patient)
    end
  end
  
  private
  def prescription_params
    params.require(:prescription).permit(
                                         :medication,
                                         :patient_id
                                        )
  end
  
end
