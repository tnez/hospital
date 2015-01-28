class CasesController < ApplicationController

  def index
    @cases = Case.all
  end

  def show
    @case = Case.find params[:id]
    @patient = @case.patient
    @symptoms = @case.symptoms
    @notes = @case.notes
    @new_note_form = NoteForm.new(@case.notes.new)
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
      @all_symptoms = Symptom.all
      render :new
    end
  end

  def create_note
    @case = Case.find(params[:id])
    @form = NoteForm.new(@case.notes.new)
    if @form.validate(params[:note])
      @form.save
      flash[:notice] = 'Note was created successfully'
      redirect_to case_path(@case)
    else
      flash[:alert] = 'There was a problem: Note was not saved!'
      render :new_note
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
      @all_symptoms = Symptom.all
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
