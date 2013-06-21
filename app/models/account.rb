class Account < ActiveRecord::Base
  include Core::BaseModel
  default_scope where :deleted=>false
  
  belongs_to :user
  belongs_to :type_account
  belongs_to :currency
  has_many :transactions
  has_many :account_states
end
