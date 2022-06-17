class Public::RelationshipsController < ApplicationController
  # フォローするとき
  def create
    current_end_user.follow(params[:end_user_id])
    @end_user = EndUser.find(params[:end_user_id])
  end
  # フォロー外すとき
  def destroy
    current_end_user.unfollow(params[:end_user_id])
    @end_user = EndUser.find(params[:end_user_id])
  end
  # フォロー一覧
  def followings
    user = EndUser.find(params[:end_user_id])
    @end_users = user.followings
  end
  # フォロワー一覧
  def followers
    user = EndUser.find(params[:end_user_id])
    @end_users = user.followers
  end
end
