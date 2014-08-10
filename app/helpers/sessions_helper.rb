module SessionsHelper

	def sign_in(user)
		remember_token=User.new_remember_token
		cookies.permanent[:remember_token]=remember_token
		user.update_attribute(:remember_token, User.digest(remember_token))
		self.current_user=user
	end
	
	def sign_out
		current_user.update_attribute(:remember_token, User.digest(User.new_remember_token))
		cookies.delete(:remember_token)
		self.current_user=nil
	end
	
	
	def signed_in?
		puts "-------------signed_in? method--------------"
		puts 		!@current_user.nil?
		puts		@current_user.nil?
		puts		@current_user
		!@current_user.nil?
	end
	
	def current_user
		puts "--------------(1)current_user----------------"
		remember_token=User.digest(cookies[:remember_token])
		puts "remember_token="+remember_token
		@current_user ||= User.find_by(remember_token: remember_token)
	end
	
	def current_user?(user)
		puts "----------(2)current_user?(user)------------"
		user==current_user
	end
	
	def current_user=(user)
		puts "--------------(3)current_user=(user)----------------"
		@current_user=user
	end
		
	def redirect_back_or(default)
		puts "-------------redirect_back_or(detault)-----------------"
		#puts "session[:return_to] = "+session[:return_to]
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end
	
	def store_location
		puts "--------------store_location----------------"
		session[:return_to]=request.url if request.get?
		puts "store_location="+session[:return_to]
	end


end
