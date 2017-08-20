# postcode-testing

## Objective

Testing the Postcodes API ('https://api.postcodes.io') using Rspec and HTTParty

## Setup

A class was created which included the module HTTParty and all the methods needed in order to retrieve postcode information over http.

## Rspec test example

    it 'single postcode should not be empty' do
          expect(@postcodes.single_postcodes('en35qj')).not_to be_empty
        end
