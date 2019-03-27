class StudentsController < ApplicationController
    before_action :authenticate_student!
    before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    # @students = Student.all
    @students = Student.page(params[:page])
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @students = Student.joins(:subjects)
                       .select('students.name, students.email, students.age, students.gender, students.opinion, subjects.id as subject_id')
                       .select('exam_results.name as exam_result_name, subjects.name as subject_name, exam_results.score')
                       .select('CAST((exam_results.score / subjects.max_score) * 100 as int) as ratio')
                       .where(id: params[:id])

    avg_result = Student.joins(:subjects)
                        .select('subjects.id as subject_id')
                        .select('CAST(AVG(exam_results.score) as int) as avg_score')        
                        .select('MAX(exam_results.score) as max_score')
                        .select('MIN(exam_results.score) as min_score')
                        .group('subjects.id')
                        .order('subjects.id')
    @score_hash = {}
    avg_result.each do |avg_res|
      h = Hash.new
      h[:avg_score] = avg_res.avg_score
      h[:max_score] = avg_res.max_score
      h[:min_score] = avg_res.min_score                                                                                                                                     
      @score_hash[avg_res.subject_id] = h
    end
  end


  # GET /students/new
  def new
    @student = Student.new
  end
  
  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: '生徒情報が追加されました' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  #def update
   # respond_to do |format|
    #  if @student.update(student_params)
     #   format.html { redirect_to @student, notice: 'Student was successfully updated.' }
      #  format.json { render :show, status: :ok, location: @student }
#      else
 #       format.html { render :edit }
  #      format.json { render json: @student.errors, status: :unprocessable_entity }
   #   end
    #end
  #end

  def update
    respond_to do |format|
      if @student.update(student_params)
        #format.html { redirect_to :action => 'index', notice: 'Student was successfully updated.' }                                                               
        format.html { redirect_to action: :index, notice: '生徒情報が更新されました' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: '生徒情報は削除されました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :email, :gender, :age, :opinion)
    end
end
