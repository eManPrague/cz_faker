# Czech faker with validators

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
      def ean
      def eic
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
      def birth_number
      def marital_status(gender = :random
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
