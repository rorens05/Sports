module Api
  module V1
    class EditorController < ApplicationController

      skip_before_action :verify_authenticity_token
      protect_from_forgery with: :null_session
      skip_before_action :authenticate_user

      def update_is_playing
        statistic = Statistic.find(params[:id])
        statistic.isPlaying = !statistic.isPlaying
        if statistic.save
          render json: {status: 'success', message: "isplaying updated"}, status: :ok
        else
          render json: {status: 'success', message: "isplaying not updated"}, status: :ok
        end
      end

      def get_players
        game = Game.find(params[:game_id])
        temp = game.contestant_teams.first.statistics
        first = []
        temp.each do |t|
          if t.isPlaying
            h_t = t.attributes
            h_t[:name] = t.player.name
            h_t[:image] = url_for(t.player.image)
            first << h_t
          end
        end

        temp = game.contestant_teams.last.statistics
        second = []
        temp.each do |t|
          if t.isPlaying
            h_t = t.attributes
            h_t[:name] = t.player.name
            h_t[:image] = url_for(t.player.image)
            second << h_t
          end
        end
        render json: {status: 'success', message: "sucess", first: first, second: second}, status: :ok
      end

      def sub_rebound
        statistic = Statistic.find(params[:id])
        statistic.rebound = statistic.rebound - 1
        if statistic.save
          render json: {status: 'success', message: "foul subtracted "}, status: :ok
        else
          render json: {status: 'success', message: "foul not updated"}, status: :ok
        end
      end

      def add_rebound
        statistic = Statistic.find(params[:id])
        statistic.rebound = statistic.rebound + 1
        if statistic.save
          render json: {status: 'success', message: "foul added "}, status: :ok
        else
          render json: {status: 'success', message: "foul not updated"}, status: :ok
        end
      end

      def sub_foul
        statistic = Statistic.find(params[:id])
        statistic.foul = statistic.foul - 1
        if statistic.save
          render json: {status: 'success', message: "foul subtracted "}, status: :ok
        else
          render json: {status: 'success', message: "foul not updated"}, status: :ok
        end
      end

      def add_foul
        statistic = Statistic.find(params[:id])
        statistic.foul = statistic.foul + 1
        if statistic.save
          render json: {status: 'success', message: "foul added "}, status: :ok
        else
          render json: {status: 'success', message: "foul not updated"}, status: :ok
        end
      end

      def sub_assist
        statistic = Statistic.find(params[:id])
        statistic.assists = statistic.assists - 1
        if statistic.save
          render json: {status: 'success', message: "assist subtracted "}, status: :ok
        else
          render json: {status: 'success', message: "assist not updated"}, status: :ok
        end
      end

      def add_assist
        statistic = Statistic.find(params[:id])
        statistic.assists = statistic.assists + 1
        if statistic.save
          render json: {status: 'success', message: "assist added "}, status: :ok
        else
          render json: {status: 'success', message: "assist not updated"}, status: :ok
        end
      end

      def add_points
        statistic = Statistic.find(params[:id])
        statistic.points = statistic.points + 1
        if statistic.save
          c = statistic.contestant_team
          score = 0;
          c.statistics.each do |s|
            score = score + s.points
          end
          c.score = score
          c.save
          render json: {status: 'success', message: "score added "}, status: :ok
        else
          render json: {status: 'success', message: "score not updated"}, status: :ok
        end
      end

      def sub_points
        statistic = Statistic.find(params[:id])
        statistic.points = statistic.points - 1
        if statistic.save
          c = statistic.contestant_team
          score = 0;
          c.statistics.each do |s|
            score = score + s.points
          end
          c.score = score
          c.save
          render json: {status: 'success', message: "score subtracted "}, status: :ok
        else
          render json: {status: 'success', message: "score not updated"}, status: :ok
        end
      end

      def sports
        sports = []
        
        sport = Admin.find(params[:admin_id]).sport
        temp = sport.attributes
        if sport.logo.attachment
          temp[:logo] =  url_for(sport.logo)
        else
          temp[:logo] = "NA"
        end
        sports.push(temp)

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

      def get_game
        game = Game.find(params[:game_id])
        score1 = game.contestant_teams.first.score
        score2 = game.contestant_teams.last.score
        
        render json: {status: 'success', message: 'teams loaded', data: game, score1: score1, score2: score2}, status: :ok
      end

      def new_game
        name = params[:name]
        event_id = params[:event_id]
        game_type = params[:game_type]
        sport_id = params[:sport_id]
        schedule = params[:schedule]
        status = params[:status]
        created_by_id = params[:created_by_id]
        updated_by_id = params[:updated_by_id]
        team2_id = params[:team2_id]
        team1_id = params[:team1_id]
        
        game = Game.new
        game.name = name
        game.event_id = event_id
        game.game_type = game_type
        game.sport_id = sport_id
        game.schedule = DateTime.parse(schedule)
        game.status = status
        game.created_by_id = created_by_id
        game.last_updated_by_id = updated_by_id
        
        if game.valid?
          game.save

          team1 = ContestantTeam.new
          team1.team_id = team1_id
          team1.score = 0
          team1.game_id = game.id

          team2 = ContestantTeam.new
          team2.team_id = team2_id
          team2.score = 0   
          team2.game_id = game.id

          if team1.valid? && team2.valid?
            team1.save
            team2.save
            
            render json: {status: 'success', message: "game saved"}, status: :ok
          else            
            render json: {status: 'failed', message: team1.errors.full_messages}, status: :ok
          end

        else
          render json: {status: 'failed', message: game.errors.full_messages}, status: :ok

        end
      end

      def edit_game
        game_id = params[:game_id]
        status = params[:status]
        last_updated_by_id = params[:last_updated_by_id]

        contestant_team_id1 = params[:contestant_team_id1]
        score1 = params[:score1]
        contestant_team_id2 = params[:contestant_team_id2]
        score2 = params[:score2]
        
        game = Game.find(game_id)
        game.status = status
        game.last_updated_by_id = last_updated_by_id
      

        team1 = game.contestant_teams.where(id: contestant_team_id1).first
        team2 = game.contestant_teams.where(id: contestant_team_id2).first
        team1.score = score1
        team2.score = score2
        if team1.valid? and team2.valid? and game.valid?
          team1.save
          team2.save
          game.save
          render json: {status: 'success', message: 'Game updated'}, status: :ok
        else
          render json: {status: 'failed', message: game.errors.full_messages}, status: :ok
        end        
      end

      
    end
  end
end