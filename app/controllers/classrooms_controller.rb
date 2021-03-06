class ClassroomsController < ApplicationController
  
  before_filter :authenticate_user!, except: [:index]

  before_filter :set_classroom, except: [:index, :new, :create]

    
  # GET /classrooms
  # GET /classrooms.json
  
  respond_to :html
  def index
    # @classrooms = User.find(params[:user_id]).classrooms
    # @classrooms = Classroom.all
    
    if params[:search]
      @classrooms = Classroom.search params[:search], :with => {
    :created_at => 1.day.ago..Time.now}
    else
      @classrooms = params[:user_id].present? ? User.find(params[:user_id]).classrooms : Classroom.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @classrooms }
    end
  end

  # GET /classrooms/1
  # GET /classrooms/1.json
  def show
    @classroom = Classroom.find(params[:id])
    
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @classroom }
    end
  end

  # GET /classrooms/new
  # GET /classrooms/new.json
  def new
    @classroom = Classroom.new
    @classroom.attachments.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @classroom }
    end
  end

  # GET /classrooms/1/edit
  def edit
    @classroom = Classroom.find(params[:id])
  end

  # POST /classrooms
  # POST /classrooms.json
  def create
    @classroom = current_user.classrooms.new(params[:classroom])
    @classroom.user_id = current_user.id

    respond_to do |format|
      if @classroom.save
        format.html { redirect_to @classroom, notice: 'Classroom was successfully created.' }
        format.json { render json: @classroom, status: :created, location: @classroom }
      else
        format.html { render action: "new" }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /classrooms/1
  # PUT /classrooms/1.json
  def update
    @classroom = Classroom.find(params[:id])

    respond_to do |format|
      if @classroom.update_attributes(params[:classroom])
        format.html { redirect_to @classroom, notice: 'Classroom was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.json
  def destroy
    @classroom = Classroom.find(params[:id])
    @classroom.destroy

    respond_to do |format|
      format.html { redirect_to classrooms_url }
      format.json { head :no_content }
    end
  end


  private
  
  def set_classroom
    
    @classroom = Classroom.find(params[:id])
  
  end
end