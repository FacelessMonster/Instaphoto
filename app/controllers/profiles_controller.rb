class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :subscribe, :unsubscribe]

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

  private

  def set_profile
    @profile = User.find(params[:id])
  end
end