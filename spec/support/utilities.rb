def full_title(page_title = '')
  base_title = "Binghamton Food Co-Op"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

def sign_out
  page.driver.submit :delete, signout_path, {}
end

def sign_in(user)
  visit signin_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Log in"
  cookies[:remember_token] = user.remember_token
end
