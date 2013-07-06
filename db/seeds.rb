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
in_type = TypeTransaction.create :name=>"Ingreso", :label=>"in"
out_type = TypeTransaction.create :name=>"Egreso", :label=>"out"

#Categories
Category.create :name=>"Sueldo", :type_transaction=>in_type
Category.create :name=>"Freelance", :type_transaction=>in_type

Category.create :name=>"Transporte", :type_transaction=>out_type
Category.create :name=>"Celular", :type_transaction=>out_type
Category.create :name=>"Picmonic", :type_transaction=>out_type
Category.create :name=>"Casa", :type_transaction=>out_type
Category.create :name=>"Railscasts", :type_transaction=>out_type
Category.create :name=>"Ropa", :type_transaction=>out_type
Category.create :name=>"Metropolitano", :type_transaction=>out_type
Category.create :name=>"Comidas", :type_transaction=>out_type
Category.create :name=>"Salidas", :type_transaction=>out_type
Category.create :name=>"Compras para Casa", :type_transaction=>out_type

#Type Accounts
TypeAccount.create :name=>"Débito", :label=>"debit"
TypeAccount.create :name=>"Crédito", :label=>"credit"