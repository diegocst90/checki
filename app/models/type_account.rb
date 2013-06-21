class TypeAccount < ActiveRecord::Base
  include Core::BaseModel
  default_scope where :deleted=>false
  
  has_many :accounts
end
