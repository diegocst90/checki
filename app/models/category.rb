class Category < ActiveRecord::Base
  include Core::BaseModel
  default_scope where(:deleted=>false).order("name ASC")
  
  has_many :transactions
  belongs_to :type_transaction
  
  attr_accessible :name, :type_transaction, :type_transaction_id, :deleted
  
  def self.find_by_type_transaction(type_transaction)
    where(:type_transaction=>type_transaction)
  end
end
