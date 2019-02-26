class LiveViewController < ApplicationController
  layout 'live'
  def single_game
    if params[:game_id]
      @game = Game.find(params[:game_id])
      if @game.blank?
        redirect_to "/404.html"
      end
    else
      redirect_to "/404.html"
    end
  end
end
