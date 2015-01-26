class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new doctor_params
    if @doctor.save
      flash[:notice] = 'Doctor was created successfully'
      redirect_to doctors_path
    else
      flash[:alert] = 'There was a problem: Doctor was not saved!'
      render :new
    end
  end

  def show
    @doctor = Doctor.find params[:id]
  end

  def edit
    @doctor = Doctor.find params[:id]
  end

  def update
    @doctor = Doctor.find params[:id]
    if @doctor.update doctor_params
      flash[:notice] = 'Doctor succesfully updated'
      redirect_to doctors_path
    else
      flash[:alert] = 'There was a problem: Doctor could not be updated!'
      render :edit
    end
  end

  def destroy
    @doctor = Doctor.find params[:id]
    if @doctor.destroy
      flash[:notice] = 'Doctor succesfully removed'
      redirect_to doctors_path
    else
      flash[:alert] = 'There was a problem: Doctor could not be removed!'
      redirect_to doctors_path
    end
  end
    
  private
  def doctor_params
    params.require(:doctor).permit(
                                   :first_name,
                                   :last_name
                                   )
  end

end
