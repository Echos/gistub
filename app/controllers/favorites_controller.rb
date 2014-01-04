# -*- encoding : utf-8 -*-
class FavoritesController < ApplicationController

  before_action :login_required

  respond_to :html

  def create
    @gist = Gist.find_commentable_gist(params[:gist_id], current_user.try(:id))
    fav = Favorite.new
    fav.gist_id = @gist.id
    fav.user_id = current_user.id
    if fav.save
      redirect_to gist_path(@gist.id), notice: 'You liked this gist.'
    else
      render action: '../gists/show'
    end
  end

  def destroy
    own_fav = Favorite.where(id: params[:id], user_id: current_user.try(:id)).first
    destroy_and_redirect_to_gist(own_fav, 'Your love is cancelled.', 'Not found.')
  end

end
