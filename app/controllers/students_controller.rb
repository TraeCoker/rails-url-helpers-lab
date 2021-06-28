class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    set_student 
    render_active_status 
  end

  def activate 
    set_student 
    @student.toggle!(:active)

    redirect_to  student_path(@student)
  end 

  private

    def set_student
      @student = Student.find(params[:id])
    end

    def render_active_status
      if @student.active == true 
        @status = "This student is currently active."
      else 
        @status = "This student is currently inactive."
      end 
    end 

end