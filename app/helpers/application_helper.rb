module ApplicationHelper
  def format_time(time)
    return time.strftime("%b %e, %Y  %l:%M %p")
  end

  def format_date(time)
    return time.strftime("%b %e, %Y")
  end

  def display_winner(rank)
    if rank == 1
      return rank.to_s + " (Winner)"
    else
      return rank
    end
  end

  def limit_string(name, num)
    name[0..num].gsub(/\s\w+\s*$/, '...')
  end

  def validate_image(image)
    if image.attachment.present?
      image
    else
      "/images/no-image-icon-11.PNG"
    end
  end

  def check_active(name)
    if controller_name == name
      return 'active'
    else
      return 'inactive'
    end
  end
end
