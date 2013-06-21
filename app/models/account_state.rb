class AccountState < ActiveRecord::Base
  include Core::BaseModel
  default_scope where :deleted=>false
  
  belongs_to :account
  belongs_to :currency_log
  belongs_to :transaction
end
