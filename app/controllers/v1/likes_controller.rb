module V1
  class LikesController < BaseController
    before_action :find_user
    before_action :find_like, :only => [:show]

    def index
      @likes = @user.likes
      render json: @likes
    end

    def show
      render json: @like
    end

    def create
      result = {}
      like = @user.send_like_to params[:to_user_id]
      if like.errors.messages.empty?
        result = like
      else
        result = like.errors
      end
      render json: result
    end

    private

    def find_user
      @user = User.find(params[:user_id])
    end

    def find_like
      @like = Like.find(params[:id])
    end
  end
end
