class ProfilesController < ApplicationController
  before_action :set_profile, except: [:my_photos, :subscribes_list, :friends_photos]

  def subscribe
    if current_user.subscriptions.find_by_friend_id(@profile.id).nil?
      @subscription = current_user.subscriptions.build
      @subscription.friend_id = @profile.id
      if @subscription.save
        redirect_to profile_path(@profile), notice: "Subscribed."
      end
    else
      redirect_to profile_path(@profile), notice: "You are already subscribed."
    end
  end

  def unsubscribe
    @subscription = current_user.subscriptions.find_by_friend_id(@profile.id)
    unless @subscription.nil?
      @subscription.destroy
      redirect_to profile_path(@profile), notice: "Unsubscribed."
      else
        redirect_to profile_path(@profile), notice: "You have not been subscribed."
    end
  end

  def show
  end

  def friends_photos
    @photos = Photo.where(user_id: current_user.subscriptions.pluck(:friend_id)).order(created_at: :desc).paginate(page: params[:page], per_page: 30)
  end

  def subscribes_list
    @subscribes = User.where(id: current_user.subscriptions.pluck(:friend_id))
  end

  def my_photos
    @photos = current_user.photos.order(created_at: :desc).paginate(page: params[:page], per_page: 30)
  end

  private

  def set_profile
    @profile = User.find(params[:id])
  end
end