class User < ActiveRecord::Base
  include Core::BaseModel
  default_scope where :deleted=>false
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :lastname1, :lastname2
  
  has_many :accounts
  
  def count_my_transactions(search)
    Transaction.count_transactions_search(id,search)
  end
  
  def list_my_transactions_search(order, start, search, items_per_time)
    Transaction.list_transactions_search(id, order, start, search, items_per_time)
  end
end
