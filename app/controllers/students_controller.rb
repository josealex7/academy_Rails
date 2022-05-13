class StudentsController < ApplicationController

    def new
      @curso = Curso.find(params[:curso_id])
      @student = @curso.students.new
    end

  def create
    @curso = Curso.find(params[:curso_id])
    @student = @curso.students.create(student_params)
    redirect_to @curso
  end

  def edit
    @curso = Curso.find(params[:curso_id])
    @student = @curso.students.find(params[:id])
  end

  def update
    @curso = Curso.find(params[:id])
    @student = @curso.students.find(params[:id])
    if @student.update(student_params)
      redirect_to curso_path(@curso)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @curso = Curso.find(params[:curso_id])
    @student = @curso.students.find(params[:id])
    @student.destroy

    redirect_to curso_path(@curso), status: 303
  end

  private
  def student_params
    params.require(:student).permit(:name, :genero, :edad)
  end
end
