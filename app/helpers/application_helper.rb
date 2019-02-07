module ApplicationHelper
  def format_time(time)
    return time.strftime("%b %e, %Y - %l:%M %p")
  end

  def display_winner(rank)
    if rank == 1
      return rank.to_s + " (Winner)"
    else
      return rank
    end
  end
end
