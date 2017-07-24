class ProfilesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @profiles = @user.profile
  end

  def new
    @user = User.find(params[:user_id])
    @profile = Profile.new
  end

  def create
    @user = User.find(params[:user_id])

    if @profile = @user.create_profile(profile_params)
      flash[:success] = "You're profile has been created!"
      redirect_to user_profile_path(@user, @profile)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])
  end

  private

    def profile_params
      params.require(:profile).permit(:photo, :age, :classification, :interest,
                                       :location, :body_type)
    end
end
