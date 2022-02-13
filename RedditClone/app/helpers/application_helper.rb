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
      --
      <small>#{comment.created_at}</small>
      </li>
    "
  end
end

def generate_children_comments(c1, all_comments)
  # return render_comment(comment).html_safe if comment.child_comments.empty?
    
  # html = render_comment(comment)
  # children = comment.child_comments
  # children.each do |child|
  #  
  # end
  # html.html_safe

  html = render_comment(c1)
  all_comments.each do |c2|
    if c2.parent_comment_id == c1.id
      html += "<ul>" + generate_children_comments(c2, all_comments) + "</ul>"
    end
  end
  html.html_safe
end
