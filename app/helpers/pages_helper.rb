module PagesHelper
	def sub subject
		mySubject = case subject
		when 1
			"Математика"
		when 2
			"Русский язык"
		when 3
			"Физика"
		when 4
			"Химия"
		when 5
			"Биология"
		when 6
			"Литература"
		when 7
			"Информатика"
		when 8
			"Английский язык"
		when 9
			"География"
		when 10
			"История"
		when 11
			"Обществознание"
		else
			false
		end
	end

	def admin_user
		redirect_to(root_path) unless current_user && current_user.admin?
	end
end
