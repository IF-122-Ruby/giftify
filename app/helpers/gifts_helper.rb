module GiftsHelper
  def toggle_favorite(gift)
    unless current_user.favorites.exists?(id: gift.id)
      link_to raw("<i class='far fa-heart favorite'></i>"), account_favorite_gifts_path(id: gift.id), remote: true, method: :post
    else
      link_to raw("<i class='fas fa-heart'></i>"), account_favorite_gift_path(gift), remote: true, method: :delete
    end
  end
end
