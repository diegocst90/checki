# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130618003818) do

  create_table "currencies", :force => true do |t|
    t.string   "name",                          :null => false
    t.string   "label",                         :null => false
    t.float    "value",                         :null => false
    t.boolean  "deleted",    :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "type_accounts", :force => true do |t|
    t.string   "name",                          :null => false
    t.string   "label",                         :null => false
    t.boolean  "deleted",    :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",                                      :null => false
    t.string   "lastname1",                                 :null => false
    t.string   "lastname2"
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "deleted",                :default => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.index ["email"], :name => "index_users_on_email", :unique => true
    t.index ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  end

  create_table "accounts", :force => true do |t|
    t.string   "name",                               :null => false
    t.integer  "user_id",                            :null => false
    t.integer  "type_account_id",                    :null => false
    t.integer  "currency_id",                        :null => false
    t.float    "amount",                             :null => false
    t.boolean  "deleted",         :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.index ["user_id"], :name => "fk__accounts_user_id"
    t.index ["type_account_id"], :name => "fk__accounts_type_account_id"
    t.index ["currency_id"], :name => "fk__accounts_currency_id"
    t.index ["user_id"], :name => "index_accounts_on_user_id"
    t.index ["type_account_id"], :name => "index_accounts_on_type_account_id"
    t.index ["currency_id"], :name => "index_accounts_on_currency_id"
    t.foreign_key ["currency_id"], "currencies", ["id"], :on_update => :restrict, :on_delete => :restrict, :name => "fk_accounts_currency_id"
    t.foreign_key ["type_account_id"], "type_accounts", ["id"], :on_update => :restrict, :on_delete => :restrict, :name => "fk_accounts_type_account_id"
    t.foreign_key ["user_id"], "users", ["id"], :on_update => :restrict, :on_delete => :restrict, :name => "fk_accounts_user_id"
  end

  create_table "currency_logs", :force => true do |t|
    t.integer  "currency_id",                    :null => false
    t.float    "value",                          :null => false
    t.boolean  "deleted",     :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.index ["currency_id"], :name => "fk__currency_logs_currency_id"
    t.index ["currency_id"], :name => "index_currency_logs_on_currency_id"
    t.foreign_key ["currency_id"], "currencies", ["id"], :on_update => :restrict, :on_delete => :restrict, :name => "fk_currency_logs_currency_id"
  end

  create_table "type_transactions", :force => true do |t|
    t.string   "name",                          :null => false
    t.string   "label",                         :null => false
    t.boolean  "deleted",    :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name",                                   :null => false
    t.integer  "type_transaction_id",                    :null => false
    t.boolean  "deleted",             :default => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.index ["type_transaction_id"], :name => "fk__categories_type_transaction_id"
    t.foreign_key ["type_transaction_id"], "type_transactions", ["id"], :on_update => :restrict, :on_delete => :restrict, :name => "fk_categories_type_transaction_id"
  end

  create_table "transactions", :force => true do |t|
    t.text     "reason",                                 :null => false
    t.integer  "currency_id",                            :null => false
    t.integer  "account_id",                             :null => false
    t.integer  "category_id",                            :null => false
    t.integer  "type_transaction_id",                    :null => false
    t.float    "amount",                                 :null => false
    t.datetime "date_transanction",                      :null => false
    t.boolean  "deleted",             :default => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.index ["currency_id"], :name => "fk__transactions_currency_id"
    t.index ["account_id"], :name => "fk__transactions_account_id"
    t.index ["category_id"], :name => "fk__transactions_category_id"
    t.index ["type_transaction_id"], :name => "fk__transactions_type_transaction_id"
    t.index ["currency_id"], :name => "index_transactions_on_currency_id"
    t.index ["account_id"], :name => "index_transactions_on_account_id"
    t.index ["category_id"], :name => "index_transactions_on_category_id"
    t.index ["type_transaction_id"], :name => "index_transactions_on_type_transaction_id"
    t.foreign_key ["account_id"], "accounts", ["id"], :on_update => :restrict, :on_delete => :restrict, :name => "fk_transactions_account_id"
    t.foreign_key ["category_id"], "categories", ["id"], :on_update => :restrict, :on_delete => :restrict, :name => "fk_transactions_category_id"
    t.foreign_key ["currency_id"], "currencies", ["id"], :on_update => :restrict, :on_delete => :restrict, :name => "fk_transactions_currency_id"
    t.foreign_key ["type_transaction_id"], "type_transactions", ["id"], :on_update => :restrict, :on_delete => :restrict, :name => "fk_transactions_type_transaction_id"
  end

  create_table "account_states", :force => true do |t|
    t.integer  "account_id",                         :null => false
    t.float    "amount",                             :null => false
    t.integer  "currency_log_id",                    :null => false
    t.integer  "transaction_id",                     :null => false
    t.boolean  "deleted",         :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.index ["account_id"], :name => "fk__account_states_account_id"
    t.index ["currency_log_id"], :name => "fk__account_states_currency_log_id"
    t.index ["transaction_id"], :name => "fk__account_states_transaction_id"
    t.index ["account_id"], :name => "index_account_states_on_account_id"
    t.index ["currency_log_id"], :name => "index_account_states_on_currency_log_id"
    t.index ["transaction_id"], :name => "index_account_states_on_transaction_id"
    t.foreign_key ["account_id"], "accounts", ["id"], :on_update => :restrict, :on_delete => :restrict, :name => "fk_account_states_account_id"
    t.foreign_key ["currency_log_id"], "currency_logs", ["id"], :on_update => :restrict, :on_delete => :restrict, :name => "fk_account_states_currency_log_id"
    t.foreign_key ["transaction_id"], "transactions", ["id"], :on_update => :restrict, :on_delete => :restrict, :name => "fk_account_states_transaction_id"
  end

end
