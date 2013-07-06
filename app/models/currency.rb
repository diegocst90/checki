class Currency < ActiveRecord::Base
  include Core::BaseModel
  default_scope where :deleted=>false
  
  has_many :accounts
  has_many :transactions
  has_many :currency_logs
  
  attr_accessible :name, :label, :value, :deleted
  
  before_update :save_log
  
  def save_log
    Currency.save(:currency=>self, :value=>self.value_was) if self.value_changed?
  end
end
