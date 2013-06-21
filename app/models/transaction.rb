class Transaction < ActiveRecord::Base
  include Core::BaseModel
  default_scope where :deleted=>false
  
  belongs_to :currency
  belongs_to :account
  belongs_to :category
  belongs_to :type_transaction
  has_many :account_states
end
