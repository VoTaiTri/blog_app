class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def import
    if params[:file]
      Course.save params[:file]
      flash[:success] = "Import successfully!"
    else
      flash[:danger] = "Choose file to import please!"
    end
    redirect_to courses_url
  end
end
