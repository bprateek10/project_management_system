class InvitationsController < Devise::InvitationsController
	def create
		self.resource = invite_resource
		resource_invited = resource.errors.empty?
		yield resource if block_given?
		resource.update_attribute(:type, 'Developer')
		if resource_invited
			if is_flashing_format? && self.resource.invitation_sent_at
				set_flash_message :notice, :send_instructions, email: self.resource.email
			end
			if self.method(:after_invite_path_for).arity == 1
				respond_with resource, location: after_invite_path_for(current_inviter)
			else
				respond_with resource, location: after_invite_path_for(current_inviter, resource)
			end
		else
			respond_with_navigational(resource) { render :new }
		end
	end


	protected
	
	def update_resource_params
		params.require(:user).permit(:password, :password_confirmation, :first_name, :last_name, :invitation_token)
	end
end