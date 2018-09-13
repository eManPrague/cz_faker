require_relative 'lib/cz_faker'

account =  CzFaker::Bank.full_account_number
puts "#{account} #{CzFaker::Validator::Bank.full_account_number? account}"

ico = CzFaker::Company.ico
puts "#{ico} #{CzFaker::Validator::Company.ico? ico}"

ean =  CzFaker::Energy.ean
puts "#{ean} #{CzFaker::Validator::Energy.ean? ean}"
puts CzFaker::Energy.ean false

eic = CzFaker::Energy.eic
puts "#{eic} #{CzFaker::Validator::Energy.eic? eic}"

eic = '27XG-PPD-DSO-CZE'
puts "#{eic} #{CzFaker::Validator::Energy.eic? eic}"

puts CzFaker::Energy.eic true, nil, 'N'
puts CzFaker::PhoneNumber.cell
puts CzFaker::PhoneNumber.land_line
puts CzFaker::Name.name
puts CzFaker::Name.name :female
puts CzFaker::Name.name :male
puts CzFaker::Address.address
puts CzFaker::Address.address
puts CzFaker::Address.address
puts CzFaker::Vehicle.numberplate_old
puts CzFaker::Vehicle.numberplate_new
puts CzFaker::Vehicle.numberplate
puts CzFaker::Person.religion
puts CzFaker::Person.birth_number
puts CzFaker::Person.birth_number "02.09.1986"
puts CzFaker::Person.birth_number nil, :female, :false
puts CzFaker::Person.birth_number nil, nil, :false
puts CzFaker::Date.numbers_padded
puts CzFaker::Date.numbers
puts CzFaker::Date.words
puts CzFaker::Bank.credit_card :visa
puts CzFaker::Bank.credit_card_formated :maestro
puts CzFaker::Bank.credit_card :master_card
puts CzFaker::Bank.full_account_number
puts CzFaker::Bank.full_account_number true
puts CzFaker::Bank.bank_code
puts CzFaker::Bank.bank_name
puts CzFaker::Bank.bank_swift

