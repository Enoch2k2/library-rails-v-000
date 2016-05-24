module AuthorsHelper
  def author_list_by_abc(starting_letter, list)
    content_tag(:ul) do
      list.collect do |list_item|
        if list_item.name.first.capitalize.include?(starting_letter.capitalize)
          list_link = link_to list_item.name, author_path(list_item)
          concat content_tag(:li, list_link)
        end
      end
    end
  end
end
