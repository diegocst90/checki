class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @page = (params[:page].to_i>0)? params[:page].to_i : 1
    @order = (params[:order].to_s != "")? params[:order].to_s : 'transactions.updated_at DESC'
    @search = params[:search].to_s
    @int_transactions = current_user.count_my_transactions(@search)
    @page, @pages, start = get_pages(@int_transactions,@page)
    @list_transactions = current_user.list_my_transactions_search(@order,start,@search,@@items_per_time)
    
    list_selects_new_transaction
  end
  
  def list_selects_new_transaction
    @list_currencies = Currency.all
    @list_type_transactions = TypeTransaction.all
    if @list_type_transactions.length
      @list_categories = Category.find_by_type_transaction(@list_type_transactions.first)
    else
      @list_categories = []
    end
  end
end
