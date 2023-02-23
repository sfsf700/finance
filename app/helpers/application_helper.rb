module ApplicationHelper
  def page_title(page_title = '')
    base_title = '俺の家計簿'

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end
end
