class ApplicationController < ActionController::Base
  protect_from_forgery
  
  @@items_per_time = 10
  
  def get_pages(int_lists, page, items_per_time = @@items_per_time, view_all = 0)
    return 1, 1, 0 if view_all > 0
    pages = (int_lists / items_per_time)+1
    pages = pages - 1 if int_lists % items_per_time == 0 and int_lists>0
    page = pages if page>pages
    start = items_per_time*(page-1)
    return page, pages, start
  end
end
