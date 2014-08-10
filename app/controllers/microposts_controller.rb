class MicropostsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy	
	
	def create
		@micropost=current_user.microposts.build(micropost_params)
		if @micropost.save
			flash[:success]="Micropost created!"
			redirect_to home_url
		else
			@feed_items=[]	# blank array to prevent errors expecting something
			render 'static_pages/home'
		end
	end
	
	def destroy
		@micropost.destroy
		redirect_to home_url	
	end
	
	private
	
		def micropost_params
			params.require(:micropost).permit(:content)
		end
		
		def correct_user
			@micropost=current_user.microposts.find_by(id: params[:id])
			redirect_to home_url if @micropost.nil?
		end
	
end