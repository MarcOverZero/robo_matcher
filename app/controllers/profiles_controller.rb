class ProfilesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @profiles = @user.profile
  end

  def show
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])
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

  def edit
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])

    if @profile.update(profile_params)
      flash[:success] = "Your profile has been updated"
      redirect_to user_profile_path(@user, @profile)
    else
      render :edit
    end
  end


  def destroy
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])

    flash[:success] = "Your profile has been deleted!"
    @profile.destroy

    redirect_to new_user_registration_path
  end

  private

    def profile_params
      params.require(:profile).permit(:photo, :age, :classification, :interest,
                                       :location, :body_type)
    end
end
