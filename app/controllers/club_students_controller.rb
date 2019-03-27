class ClubStudentsController < ApplicationController
  before_action :authenticate_student!
  before_action :set_club_student, only: [:show, :edit, :update, :destroy]
  before_action :set_students_clubs, only: [:new, :edit]

  # GET /club_students
  # GET /club_students.json
  def index
    @club_students = ClubStudent.all
  end

  # GET /club_students/1
  # GET /club_students/1.json
  def show
  end

  # GET /club_students/new
  #def new
   # @club_student = ClubStudent.new
  #end

   # GET /club_students/new
   def new
    if params[:student_id]
      @student = Student.find(params[:student_id])
      @selected_student = [@student.name, @student.id]
    end
    @club_student = ClubStudent.new
  end
  
  #club_studentsのnewページをセレクトボックスにする
  def set_students_clubs
    @students = Student.all.pluck(:name, :id)
    @clubs = Club.all.pluck(:name, :id)
  end
  # GET /club_students/1/edit
  def edit
  end

  # POST /club_students
  # POST /club_students.json
  def create
    @club_student = ClubStudent.new(club_student_params)

    respond_to do |format|
      if @club_student.save
        format.html { redirect_to @club_student, notice: 'Club student was successfully created.' }
        format.json { render :show, status: :created, location: @club_student }
      else
        format.html { render :new }
        format.json { render json: @club_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /club_students/1
  # PATCH/PUT /club_students/1.json
  def update
    respond_to do |format|
      if @club_student.update(club_student_params)
        format.html { redirect_to @club_student, notice: 'Club student was successfully updated.' }
        format.json { render :show, status: :ok, location: @club_student }
      else
        format.html { render :edit }
        format.json { render json: @club_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /club_students/1
  # DELETE /club_students/1.json
  def destroy
    @club_student.destroy
    respond_to do |format|
      format.html { redirect_to club_students_url, notice: 'Club student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club_student
      @club_student = ClubStudent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_student_params
      params.require(:club_student).permit(:student, :club_id)
    end
end
