module ApplicationHelper

  #ページごとの完全なタイトルを返す
  def full_title(page_title = '')
    base_title = "no title"
    if page_title.empty?
      base_title
    else
      page_title + " page"
    end
  end
end
