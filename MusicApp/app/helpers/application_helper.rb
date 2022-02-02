module ApplicationHelper  

  def auth_token
    html = "<input type=\"hidden\" name=\"authenticity_token\" value=\"#{form_authenticity_token}\">"
    html.html_safe
  end

  def ugly_lyrics(lyrics)
    nicer_lyrics = lyrics.split("\r\n")
    nicer_lyrics.map! { |line| "&#9835; " + line}
    nicer_lyrics = nicer_lyrics.join("\r\n")
    ("<pre>" + nicer_lyrics + "</pre>").html_safe
  end
end
