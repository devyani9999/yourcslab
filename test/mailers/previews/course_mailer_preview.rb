# Preview all emails at http://localhost:3000/rails/mailers/course_mailer
class CourseMailerPreview < ActionMailer::Preview
  default from: "support@yourcslab.com"
  default reply_to: "support@yourcslab.com"

  def enrol
    mail(to: User.first.email, subject: "Your enrollment to course: #{Course.first.name}")
  end
end
