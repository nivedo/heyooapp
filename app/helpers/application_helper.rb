module ApplicationHelper
  # Gravatar support for user avatars
  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://secure.gravatar.com/avatar/#{gravatar_id}.png?d=identicon"
  end

  # Used for markdown support in contents
  def markdown(text)
    #renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, options).render(text).html_safe
  end

  # Might be unnecessary, but helps limit content lengths
  def condenseString(text)
    condensed = strip_tags( markdown text )
    if(condensed.length > 300)
      condensed = condensed[0...299] + "..."
    end
    sanitize condensed
  end
end
