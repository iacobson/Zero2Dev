module UsersHelper

  # Returns the Gravatar
  def gravatar_for(user, size)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravtar_url, alt: user.email, class: "gravatar")

  end
end
