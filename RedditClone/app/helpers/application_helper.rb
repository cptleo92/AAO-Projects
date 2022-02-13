module ApplicationHelper

  def auth_token
    "<input
      type=\"hidden\"
      name=\"authenticity_token\"
      value=\"#{form_authenticity_token}\"
    >".html_safe
  end

  def profile(user)
    "<a href=\"#{user_url(user.id)}\">#{user.username}</a>".html_safe
  end
  
end
