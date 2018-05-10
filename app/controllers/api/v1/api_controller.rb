module api::v1
	class apiController < applicationController
		acts_as_token_authentication_handler_for User

		before_action :require_authentication!

		private

		def require_authentication!
		  throw(:warden, scope: :user) unless current_user.presence
		end
	end
end