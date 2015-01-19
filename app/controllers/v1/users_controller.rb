module V1
  class UsersController < BaseController

    before_action :find_user, :only => [:show, :compatible_users]

    def index
      users = User.all
      render json: users
    end

    def show
      render json: @current_user
    end

    def create
      result = {}

      user = find_or_create_user params
      if user.errors.messages.empty?
        profile = find_or_create_profile user.id, params
        if !profile.errors.messages.empty?
          result = {error: profile.errors.messages}
        else
          result = user
        end
      else
        result = {error: user.errors.messages}
      end
      render json: result
    end

    def compatible_users
      render json: @current_user.search_compatible_users
    end

    def sign_in
      result = User.where(user_name: params[:user_name]).first
      if result.nil?
        result = {error: "invalid user"}
      end
      render json: result
    end

    private

    def find_user
      @current_user = User.where(id: params[:id]).first
    end

    def find_or_create_user params
      User.find_or_create_by(
                             user_name: params[:user_name],
                             email: params[:email],
                             gender: params[:gender],
                             age: params[:age]
                            )
    end

    def find_or_create_profile user_id, params
      profile = Profile.find_or_create_by(
                                          user_id: user_id,
                                          orientation: params[:orientation],
                                          age_range: params[:age_range]
                                          )

    end

  end
end
