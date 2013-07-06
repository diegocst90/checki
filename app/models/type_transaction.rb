class TypeTransaction < ActiveRecord::Base
  include Core::BaseModel
  default_scope where :deleted=>false
  
  has_many :transactions
  has_many :categories
  
  attr_accessible :name, :label, :deleted
end
