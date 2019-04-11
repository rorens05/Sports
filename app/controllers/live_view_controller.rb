class LiveViewController < ApplicationController
  layout 'live'
  def single_game
    if params[:game_id]
      @game = Game.find(params[:game_id])
      @games = Game.where(event_id: @game.event_id).order("updated_at DESC")
      if @game.blank?
        redirect_to "/404.html"
      end
    else
      redirect_to "/404.html"
    end
  end

  def result
    @game = Game.find(params[:game_id])
    @contestants = ContestantTeam.where(game_id: @game.id).order("score DESC")
    @ranks = Array.new
    rank = 1
    for  x  in 0..(@contestants.size - 1)
      if @ranks.size > 0 && @contestants[x].score == @contestants[x - 1].score
        @ranks << @ranks[x - 1]
      else
        @ranks << rank
      end
      rank = rank + 1
      puts @ranks[x]

    end
  end
end
