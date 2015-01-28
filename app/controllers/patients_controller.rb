class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find params[:id]
  end

  def new
    @form = PatientForm.new(Patient.new)
  end

  def create
    @form = PatientForm.new(Patient.new)
    if @form.validate(params[:patient])
      @form.save
      flash[:notice] = 'Patient was created succesfully'
      redirect_to patients_path
    else
      flash[:alert] = 'There was a problem: Patient was not saved!'
      render :new
    end
  end

  def edit
    @form = PatientForm.new(Patient.find(params[:id]))
  end

  def update
    @form = PatientForm.new(Patient.find(params[:id]))
    if @form.validate(params[:patient])
      @form.save
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

end
