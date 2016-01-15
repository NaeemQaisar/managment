module ClassroomsHelper
	def current_users_email
		current_user.present? ? current_user.email : 'Guest'
	end
end
