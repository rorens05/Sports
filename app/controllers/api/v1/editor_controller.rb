module Api
  module V1
    class EditorController < ApplicationController

      skip_before_action :verify_authenticity_token
      protect_from_forgery with: :null_session
      skip_before_action :authenticate_user

      def sports
        sports = []
        
        Sport.all.each do |sport|
          if sport.teams.where(event_id: params[:event_id]).count > 0
            temp = sport.attributes
            if sport.logo.attachment
              temp[:logo] =  url_for(sport.logo)
            else
              temp[:logo] = "NA"
            end

            sports.push(temp)
          end
        end        
        render json: {status: 'success', message: 'sports loaded', data: sports}, status: :ok
      end  
      
      def events
        render json: {status: 'success', message: 'events loaded', data: Event.all}, status: :ok
      end

      def teams
        if params[:event_id]
          teams = []
          count = 0
          Team.where(event_id: params[:event_id], sport_id: params[:sport_id]).each do |team|
            temp = team.attributes
            if team.logo.attachment
              temp[:logo] = url_for(team.logo)
            else
              temp[:logo] = "NA"
            end
            teams.push(temp)
            count = count + 1
          end        
  
          render json: {status: 'success', message: 'teams loaded', data: teams, count: count}, status: :ok
        else
          teams = []
          count = 0
          Team.all.each do |team|
            temp = team.attributes
            if team.logo.attachment
              temp[:logo] = url_for(team.logo)
            else
              temp[:logo] = "NA"
            end
            teams.push(temp)
            count = count + 1
          end        
  
          render json: {status: 'success', message: 'teams loaded', data: teams, count: count}, status: :ok

        end
      end

      def games
        games = []
        
        Game.where(event_id: params[:event_id], sport_id: params[:sport_id]).order("schedule desc").each do |game|
          temp = game.attributes
          temp[:contestant] = game.contestant_teams
          games.push(temp)
        end

        render json: {status: 'success', message: 'teams loaded', data: games}, status: :ok
      end
    end
  end
end