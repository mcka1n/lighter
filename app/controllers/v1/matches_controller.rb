module V1
  class MatchesController < BaseController

    before_action :find_user
    before_action :find_match, :only => [:show]

    def index
      @matches = @user.matches
      render json: @matches
    end

    def show
      render json: @match
    end

    private

    def find_user
      @user = User.where(id: params[:user_id]).first
    end

    def find_match
      @match = Match.where(id: params[:id]).first
    end

  end
end
