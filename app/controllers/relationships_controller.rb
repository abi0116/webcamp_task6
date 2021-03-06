class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    followed = current_user.follow(@user)
    if followed.save
      flash[:success] = "フォローできました"
      redirect_back fallback_location: root_path
    else
      flash.now[:alert] = "フォローに失敗しました"
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    followed = current_user.unfollow(@user)
    if followed.destroy
      flash[:success] = "フォロー解除ができました"
      redirect_back fallback_location: root_path
    else
      flash.now[:alert] = "フォロー解除に失敗しました"
      redirect_back fallback_location: root_path
    end
  end

  private

  def set_user
    @user = User.find(params[:relationship][:followed_id])
  end

end
