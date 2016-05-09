module ApplicationHelper
  def list_label(starting_letter)
    content_tag(:h2) do
      starting_letter.capitalize
    end
  end

  def list_by_abc(starting_letter, list)
    content_tag(:ul) do
      list.collect do |list_item|
        if list_item.title.first.capitalize.include?(starting_letter.capitalize)
          list_link = link_to list_item.title, book_path(list_item)
          list_edit_link = link_to "Edit #{list_item.title}", edit_book_path(list_item)
          concat content_tag(:li, list_link)
          if user_signed_in?
            if current_user.admin?
              concat content_tag(:li, list_edit_link)
            end
          end
        end
      end
    end
  end

end
