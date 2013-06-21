# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Currencies and logs
sol_currency = Currency.create :name=>"Sol", :label=>"S/.", :value=>1
CurrencyLog.create :currency=>sol_currency, :value=>sol_currency.value

dolar_currency = Currency.create :name=>"Dólar", :label=>"$", :value=>2.70
CurrencyLog.create :currency=>dolar_currency, :value=>sol_currency.value

euro_currency = Currency.create :name=>"Euro", :label=>"€", :value=>3.73
CurrencyLog.create :currency=>euro_currency, :value=>sol_currency.value

#Type Transactions
TypeTransaction.create :name=>"Ingreso", :label=>"in"
TypeTransaction.create :name=>"Egreso", :label=>"out"

#Categories
Category.create :name=>"Transporte"
Category.create :name=>"Celular"
Category.create :name=>"Picmonic"
Category.create :name=>"Casa"
Category.create :name=>"Railscasts"
Category.create :name=>"Ropa"
Category.create :name=>"Metropolitano"
Category.create :name=>"Comidas"
Category.create :name=>"Salidas"
Category.create :name=>"Compras para Casa"

#Type Accounts
TypeAccount.create :name=>"Débito", :label=>"debit"
TypeAccount.create :name=>"Crédito", :label=>"credit"