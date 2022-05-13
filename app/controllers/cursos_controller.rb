class CursosController < ApplicationController
  def index
    @cursos = Curso.all
  end

  def show
    @curso = Curso.find(params[:id])
  end

  def new
    @curso = Curso.new
  end

  def create
    @curso = Curso.new(curso_params)

    if @curso.save
      redirect_to cursos_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @curso = Curso.find(params[:id])
  end

  def update
    @curso = Curso.find(params[:id])

    if @curso.update(curso_params)
      redirect_to cursos_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @curso = Curso.find(params[:id])
    @curso.destroy

    redirect_to cursos_path, status: :see_other
  end

  private
  def curso_params
    params.require(:curso).permit(:name, :grado)
  end



end
