RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
#   config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

#   config.authorize_with do |controller|
# 	if !_current_user.admin?
# 	  redirect_to root_path, flash: {error: 'You are not Admin!'}
# 	end
#   end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model CatImage do
	list do
	  field :id 
      field :cat_id
	  field :link do
		pretty_value do
			bindings[:view].tag(:img, { :src => bindings[:object].link})
		end
	  end
	  field :created_at
      field :updated_at
	end
  end

  config.model FoodImage do
	list do
	  field :id 
      field :food_id 
	  field :link do
		pretty_value do
			bindings[:view].tag(:img, { :src => bindings[:object].link})
		end
	  end
	  field :created_at
      field :updated_at
	end
  end
end
