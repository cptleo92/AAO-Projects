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
  
  def render_comment(comment)
    "<li><a href=\"#{comment_url(comment.id)}\">#{comment.content}</a>
      --
      <small>#{profile(comment.author)}</small>
      </li>
    "
  end
end

def generate_children_comments(comment)
  return render_comment(comment).html_safe if comment.child_comments.empty?

  html = render_comment(comment)
  children = comment.child_comments
  children.each do |child|
    html += "<ul>" + generate_children_comments(child) + "</ul>"
  end
  html.html_safe
end
