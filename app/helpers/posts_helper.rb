module PostsHelper
  def set_class_for_category_link(category_name, params_category_name)
    class_name = 'list-group-item list-group-item-action border-0 '

    return class_name + 'active' if category_name == params_category_name
    class_name
  end
end
