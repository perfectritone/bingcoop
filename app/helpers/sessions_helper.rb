module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
    unless session.has_key?(:search)
      session[:search] = Hash.new 
      Recipe::SEARCH_OPTIONS.each do |option|
        session[:search][option] = ''
      end
    end
  end
  
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token].to_s)
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in."
    end
  end
  
  def parent_of_recipe?(recipe_id)
    if signed_in?
      recipe = Recipe.find(recipe_id)
      current_user? recipe.user
    end
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
  
  def raw?
    (session[:search][:raw] == 'false')
  end
  
  def gluten_free?
    (session[:search][:gluten_free] == 'false')
  end
end
