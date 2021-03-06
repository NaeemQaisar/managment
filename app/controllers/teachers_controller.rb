class TeachersController < ApplicationController
  
  # before_filter :set_teacher, except: [:index, :new, :create]
  before_filter :set_teacher, only: [:show, :edit, :update, :destroy]
  
  respond_to :html
  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teachers }
    end
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
    teacher = Teacher.new
    @teachers = @student.teachers 
    # @teacher = Teacher.find(params[:id])
       
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teacher }
    end
  end

  # GET /teachers/new
  # GET /teachers/new.json
  def new
    @teacher = Teacher.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teacher }
    end
  end

  # GET /teachers/1/edit
  def edit
    # @teacher = Teacher.find(params[:id])
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = @classroom.teachers.new(params[:teacher])
    @students = Student.where(:id => params[:student])
    @teacher.students << @students
    
    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
        format.json { render json: @teacher, status: :created, location: @teacher }
      else
        format.html { render action: "new" }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teachers/1
  # PUT /teachers/1.json
  def update
    # @teacher = Teacher.find(params[:id])

    respond_to do |format|
      if @teacher.update_attributes(params[:teacher])
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to teachers_url }
      format.json { head :no_content }
    end
  end
  private
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end
end