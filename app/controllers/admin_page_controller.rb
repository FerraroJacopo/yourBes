class AdminPageController < ApplicationController


def new
	@users=User.all
	@user=User.new
	arr = Array.new
	@u = User.pluck(:username)
	

	#User.find_by(nome: 'Giacopo').update_attribute(:admin, false)
end 

def up
	po=params[:bo]


	if User.find_by(username: po).admin?
		User.find_by(username: po).update_attribute(:admin, false)

	else 
		User.find_by(username: po).update_attribute(:admin, true)
	end 
	redirect_to '/admin_page'
end


end 