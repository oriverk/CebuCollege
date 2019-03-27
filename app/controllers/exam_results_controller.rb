class ExamResultsController < ApplicationController
  before_action :authenticate_student!
  before_action :set_exam_result, only: [:show, :edit, :update, :destroy]
  before_action :set_students_subjects, only: [:new, :edit]

   # GET /exam_results
  # GET /exam_results.json
  def index
    #@exam_results = ExamResult.all
    @exam_results = ExamResult.page(params[:page])
  end

  # GET /exam_results/1
  # GET /exam_results/1.json
  def show
  end

  # GET /exam_results/new
  def new
    if params[:student_id]
      @student = Student.find(params[:student_id])
      @selected_student = [@student.name, @student.id]
    end
    @exam_result = ExamResult.new
  end
  
  #exam_resultsのnewページをセレクトボックスにする
  def set_students_subjects
    @students = Student.all.pluck(:name, :id)
    @subjects = Subject.all.pluck(:name, :id)
  end

  # GET /exam_results/1/edit
  def edit
  end

  # POST /exam_results
  # POST /exam_results.json
  def create
    @exam_result = ExamResult.new(exam_result_params)

    respond_to do |format|
      if @exam_result.save
        format.html { redirect_to @exam_result, notice: 'Exam result was successfully created.' }
        format.json { render :show, status: :created, location: @exam_result }
      else
        format.html { render :new }
        format.json { render json: @exam_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exam_results/1
  # PATCH/PUT /exam_results/1.json
  def update
    respond_to do |format|
      if @exam_result.update(exam_result_params)
        format.html { redirect_to @exam_result, notice: 'Exam result was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam_result }
      else
        format.html { render :edit }
        format.json { render json: @exam_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_results/1
  # DELETE /exam_results/1.json
  def destroy
    @exam_result.destroy
    respond_to do |format|
      format.html { redirect_to exam_results_url, notice: 'Exam result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_result
      @exam_result = ExamResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_result_params
      params.require(:exam_result).permit(:student_id, :subject_id, :name, :score)
    end
end
