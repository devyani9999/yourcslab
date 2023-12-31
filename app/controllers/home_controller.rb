class HomeController < ApplicationController
	def index
	end

	def details
	end

	def enrol_now
		course_id = params[:course_id]
		@course = Course.find_by(id: course_id)
	end

	def contact
	end

	def submit_contact_query
		ContactFormQuery.create(contact_params)
		redirect_to root_path, notice: "Your query is submitted. We will get back to you soon :)"
	end


	private

	def contact_params
		params.require(:contact).permit(:first_name, :last_name, :email, :query_text)
	end
end
