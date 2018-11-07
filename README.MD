# Czech data faker with validators

## Install

```bash
gem install cz_faker
```

or with bundler add into `Gemfile`

```bash
gem 'cz_faker'
```

then run

```bash
bundle install
```

## Examples

```ruby
require 'cz_faker'

> account = CzFaker::Bank.full_account_number
=> "7768972933/3030"

> CzFaker::Validator::Bank.full_account_number? account
=> true

> ico = CzFaker::Company.ico
=> "69611637"

> CzFaker::Validator::Company.ico? ico
=> true

> ean =  CzFaker::Energy.ean
=> "859182400433239577"

> CzFaker::Validator::Energy.ean? ean
=> true

> eic = CzFaker::Energy.eic
=> "27ZG320V3481361N"

> CzFaker::Validator::Energy.eic? eic
=> true

> CzFaker::Energy.eic true, nil, 'N'
=> "27ZG188N2995024C"

> CzFaker::PhoneNumber.cell
=> "711829784"

> CzFaker::PhoneNumber.land_line
=> "238521209"

> CzFaker::Name.name
=> "Lájoš Hympl"

> CzFaker::Name.name :female
=> "Lizama Nižinská"

> CzFaker::Address.address
=> "Part. Svobody 23/3, Oprostovice, 25226"

> CzFaker::Vehicle.numberplate_old
=> "SMP85-92"

> CzFaker::Vehicle.numberplate_new
=> "1L15873"

> CzFaker::Person.birth_number
=> "580723/5632"

> CzFaker::Person.birth_number "01.01.1986"
=> "860101/5247"

> CzFaker::Person.birth_number nil, :female, :false
=> "185709/2732"

> CzFaker::Bank.credit_card :visa
=> "4956903229284923"

> CzFaker::Bank.credit_card_formated :maestro
=> "5020 2490 7191 8328"

> CzFaker::Bank.full_account_number
=> "5130806494/5800"
```

## CzFaker::Date

```
      def numbers(year = YEARS)
      def numbers_without_dots(year = YEARS)
      def numbers_padded(year = YEARS)
      def words(year = YEARS)
```

## CzFaker::Name

```
      def first_name(gender = :random)
      def last_name(gender = :random)
      def name(gender = :random)
      def name_with_prefix(gender = :random)
      def name_with_suffix(gender = :random)
      def name_with_titles(gender = :random)
      def prefix
      def suffix
```

## CzFaker::Energy

```
      def ean(lds = true, dist_code = nil)
      def eic(lds = true, dist_code = nil, type = nil)
      def gas_distribution_company
      def electricity_distribution_company
```

## CzFaker::Bank

```
      def full_account_number(with_prefix = false)
      def account_number(with_prefix = false)
      def bank_code
      def bank_name
      def bank_swift
      def bank
      def credit_card(type = nil)
      def credit_card_formated(type = nil)
```      

## CzFaker::PhoneNumber

```
      def cell
      def land_line
      def free_line
      def international_cell
      def international_land_line
      def country_prefix
      def cell_prefix
      def land_line_prefix
      def free_prefix
```

## CzFaker::Number

```
      def integer(length = 6)
      def integer_between(min, max)
```

## CzFaker::Company

```
      def name
      def suffix
      def base_name
      def ico
      def dic(ico = nil)
      def legal_form_short
      def legal_form_name
      def legal_form_code
```

## CzFaker::PaymentMethod

```
      def method
```

## CzFaker::Person

```
      def gender
      def birth_number(date = nil, gender = :male, slash = true)
      def marital_status(gender = :random)
      def drivers_license
      def education
      def height
      def weight
      def id_number
      def religion
```

## CzFaker::Address

```
      def street
      def city
      def house_number
      def street_number
      def city_part
      def region
      def post_code
      def address
```      

## CzFaker::Vehicle

```
      def numberplate
      def numberplate_old(region = nil)
      def numberplate_new(region = nil)
```

## CzFaker::Validator::Bank

```
      def account_number?(account_number)
      def full_account_number?(account_number)
      def credit_card?(card_number)
      def bank_code?(code)
```


## CzFaker::Validator::Company

```
      def ico?(number)
      def dic?(number)
```

## CzFaker::Validator::Energy

```
      def ean?(code)
      def eic?(code)
```

## CzFaker::Validator::Person

```
      def birth_number?(birth_number)
```
