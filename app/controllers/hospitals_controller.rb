class HospitalsController < ApplicationController

  def index
    @hospitals = Hospital.all
  end

  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.new hospital_params
    if @hospital.save
      flash[:notice] = 'Hospital was created succesfully'
      redirect_to patients_path
    else
      flash[:alert] = 'There was a problem: Hospital was not saved!'
      render :new
    end
  end

  def show
    @hospital = Hospital.find params[:id]
    @patients = @hospital.patients
  end

  def edit
    @hospital = Hospital.find params[:id]
  end

  def update
    @hospital = Hospital.find params[:id]
    if @hospital.update hospital_params
      flash[:notice] = 'Hospital was succesfully updated'
      redirect_to hospitals_path
    else
      flash[:alert] = 'There was a problem: Hospital was not updated!'
      render :edit
    end
  end

  def destroy
    @hospital = Hospital.find params[:id]
    if @hospital.destroy
      flash[:notice] = 'Hospital was succesfully removed'
      redirect_to hospitals_path
    else
      flash[:alert] = 'There was a problem: Hospital could not be removed!'
      redirect_to hospitals_path
    end
  end

  private
  def hospital_params
    params.require(:hospital).permit(
                                     :name
                                    )
  end

end
