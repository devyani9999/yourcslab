class CoursesController < ApplicationController

  def index
    @courses = Course.all
    @course = Course.first
    render(:layout => "user_layout")
  end

  def show
    course_id = params[:id]
    @course = Course.find_by(id: course_id)
    respond_to do |format|
      format.json { render json: @course.as_json, status: :ok}
    end
  end

  def details
    course_id = params[:course]
    course = Course.find_by(id: course_id)

  end

  def enrol
    course_id = params[:course]
    @course = Course.find_by(id: course_id)
    unless current_user.courses.pluck(:id).include?(@course.id)
      current_user.enrollments.create(course_id: @course.id)
      CourseMailer.with(user: current_user, course: @course).enrol.deliver_now
    end
    redirect_to user_dashboard_path(current_user.id, enrollment: "yes")
  end
end
