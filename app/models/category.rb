class Category < ActiveRecord::Base
  include Core::BaseModel
  default_scope where(:deleted=>false).order("name ASC")
  
  has_many :transactions
end
