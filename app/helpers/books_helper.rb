module BooksHelper

  def book_list
    content_tag(:ul) do
      yield
    end
  end

end
