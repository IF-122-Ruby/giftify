module PostsHelper
  def post_menu
    if current_page?(controller: 'posts', action: 'index')
      content_tag(:ul, class: 'btn-toggle-nav list-unstyled fw-normal pb-1 small') do
        render 'posts/categories'
      end
    end
  end
end
