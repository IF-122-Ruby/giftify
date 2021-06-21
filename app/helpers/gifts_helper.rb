module GiftsHelper
  def toggle_favorite_link(gift)
    if current_user.favorite_gifts.exists?(id: gift.id)
      link_to raw("<i class='fas fa-heart like'></i>"), account_favorite_gift_path(id: gift.id), remote: true, method: :delete
    else
      link_to raw("<i class='far fa-heart like'></i>"), account_favorite_gifts_path(id: gift.id), remote: true, method: :post
    end
  end
end
