class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find params[:id]
    @hospital = @patient.hospital
  end

  def new
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.new
  end

  def create
    @hospital = Hospital.find params[:hospital_id]
    success = @hospital.patients.create patient_params
    if success
      flash[:notice] = 'Patient was created succesfully'
      redirect_to patients_path
    else
      flash[:alert] = 'There was a problem: Patient was not saved!'
      render :new
    end
  end

  def edit
    @patient = Patient.find params[:id]
  end

  def update
    @patient = Patient.find params[:id]
    if @patient.update(patient_params)
      flash[:notice] = 'Patient succesfully updated'
      redirect_to patients_path
    else
      flash[:alert] = 'There was a problem: Patient could not be updated!'
      render :edit
    end
  end

  def destroy
    @patient = Patient.find params[:id]
    if @patient.destroy
      flash[:notice] = 'Patient was succesfully removed'
      redirect_to patients_path
    else
      flash[:alert] = 'There was a problem: Patient could not be removed!'
      redirect_to patients_path
    end
  end

  private
  def patient_params
    params.require(:patient).permit(:name_first,
                                    :name_last,
                                    :date_of_birth,
                                    :description,
                                    :gender,
                                    :blood_type
                                   )
    
  end
  
end
