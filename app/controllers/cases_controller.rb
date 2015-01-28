class CasesController < ApplicationController

  def index
    @cases = Case.all
  end

  def show
    @case = Case.find params[:id]
    @patient = @case.patient
    @symptoms = @case.symptoms
  end

  def new
    @form = CaseForm.new(Case.new)
  end

  def create
    @form = CaseForm.new(Case.new)
    if @form.validate(params[:case])
      @form.save
      flash[:notice] = 'Case was created succesfully'
      redirect_to cases_path
    else
      flash[:alert] = 'There was a problem: Case was not saved!'
      render :new
    end
  end

  def edit
    @form = CaseForm.new(Case.find(params[:id]))
  end

  def update
    @form = CaseForm.new(Case.find(params[:id]))
    if @form.validate(params[:case])
      @form.save
      flash[:notice] = 'Case succesfully updated'
      redirect_to cases_path
    else
      flash[:alert] = 'There was a problem: Case could not be updated!'
      render :edit
    end
  end

  def destroy
    @case = Case.find params[:id]
    if @case.destroy
      flash[:notice] = 'Case was succesfully removed'
      redirect_to cases_path
    else
      flash[:alert] = 'There was a problem: Case could not be removed!'
      redirect_to cases_path
    end
  end
  
end
