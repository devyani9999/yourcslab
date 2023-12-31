class CourseMailer < ApplicationMailer
  default from: "support@yourcslab.com"
  default reply_to: "support@yourcslab.com"

  def enrol
    @user = params[:user]
    @course = params[:course]
    mail(to: @user.email, subject: "Your enrollment to course: #{@course.name}")
  end
end
