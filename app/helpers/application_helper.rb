module ApplicationHelper
  def page_title(page_title = '')
    base_title = 'mocha家計簿'

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end
end
