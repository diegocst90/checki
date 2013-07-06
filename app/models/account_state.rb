class AccountState < ActiveRecord::Base
  include Core::BaseModel
  default_scope where :deleted=>false
  
  belongs_to :account
  belongs_to :currency_log
  belongs_to :transaction
  
  attr_accessible :account_id, :amount, :currency_log_id, :transaction_id, :deleted
end
