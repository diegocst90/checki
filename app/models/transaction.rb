class Transaction < ActiveRecord::Base
  include Core::BaseModel
  default_scope where :deleted=>false
  
  belongs_to :currency
  belongs_to :account
  belongs_to :category
  belongs_to :type_transaction
  has_many :account_states
  
  attr_accessible :reason, :currency_id, :account_id, :category_id, :type_transaction_id, :amount, :date_transaction, :deleted

  def self.count_transactions(id)
    joins(:account).count(:conditions=>{:accounts=>{:user_id=>id}})
  end
  
  def self.count_transactions_search(id, search)
    return self.count_transactions(id) if search.blank?
    search = "%" + search + "%"
    joins(:account).count(:conditions=>["accounts.user_id = ? and (accounts.name LIKE ? or transactions.reason LIKE ?)", id, search, search])
  end
  
  def self.list_transaction(id, order, start, items_per_time)
    joins(:account).order(order).offset(start).limit(items_per_time).count(:conditions=>{:accounts=>{:user_id=>id}})
  end
  
  def self.list_transactions_search(id, order, start, search, items_per_time)
    return self.list_transaction(id, order, start, items_per_time) if search.blank?
    joins(:account).order(order).offset(start).limit(items_per_time).count(:conditions=>["accounts.user_id = ? and (accounts.name LIKE ? or transactions.reason LIKE ?)", id, search, search])
  end
end
