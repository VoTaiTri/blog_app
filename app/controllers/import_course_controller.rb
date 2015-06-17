class ImportCourseController < ApplicationController
  def new
    @courses = Course.all
    @import_cource = ImportCourse.new
  end

  def create
    if params[:import_course]
      @import_user = ImportCourse.new params[:import_course]

      if @import_user.save
        redirect_to courses_url, notice: "Imported courses successfully."
      else
        render :new
      end
    else
      flash[:danger] = "Choose file to import please!"
    end
  end
end

    