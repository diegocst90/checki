class CurrencyLog < ActiveRecord::Base
  include Core::BaseModel
  default_scope where :deleted=>false
  
  belongs_to :currency
  has_many :account_states
  
  def self.get_currency_by_date(currency_id, date_passed)
    currency_log = where("currency_id = ? and created_at >= ?", currency_id, date_passed).order("created_at DESC").limit(1)
    currency_log = new(:currency_id=>currency_id, :created_at=>date_passed, :updated_at=>date_passed, :value=>Currency.unscoped.find(currency_id).value) if currency_log.blank?
  end
end
