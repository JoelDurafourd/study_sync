module CheckAvatar
  # this module checks if the current user avatar is present or not. If no user avatar is provided, it provides one for you located in assets/images folder
  def check_avatar(current_user)
    if user.image.nil?
      # return default image
      img = "/app/assets/images/default_avatar.png"
    else
        # return user avatar
        cl_image_tag(current_user.photo.key, class: "avatar", alt: "dropdown menu")
    end
  end
end
