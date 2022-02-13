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
    "<li>
      (#{comment.score})
      <a href=\"#{comment_url(comment.id)}\">#{comment.content}</a>
      --
      <small>#{profile(comment.author)}</small>
      --
      <small>#{comment.created_at}</small>
      --
      <small><a href=\"#{upvote_comment_url(comment.id)}\">Upvote</a>/<a href=\"#{downvote_comment_url(comment.id)}\">Downvote</a></small>
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

  return render_comment(c1).html_safe if all_comments[c1.id].nil? 

  html = render_comment(c1)
  children = all_comments[c1.id]
  children.each do |c2|       
    html += "<ul>" + generate_children_comments(c2, all_comments) + "</ul>"  
  end
  html.html_safe

end
