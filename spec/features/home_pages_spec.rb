require 'rails_helper'

RSpec.feature "HomePages", type: :feature do
  context 'Going to a website' do
    Steps 'Visiting a home page' do
      Given 'I am on the home page' do
        visit '/'
      end
      Then 'I can see all the apartments' do
        expect(page).to have_content('Listing Apartments')
      end
      When 'I visit the owner page and add an owner' do
        visit '/owners/new'
        fill_in 'owner[name]', with: 'Vivian'
        fill_in 'owner[time]', with: '3:00 pm after'
        fill_in 'owner[phone_number]', with: '4083156098'
        click_button 'Create Owner'
      end
      When 'I click the link to the new apartment' do
        visit '/apartments/new'
      end
      Then 'I can fill in a form' do
        fill_in 'apartment[address1]', with: '7182 Sharon Drive'
        fill_in 'apartment[city]', with: 'San Jose'
        fill_in 'apartment[state]', with: 'CA'
        select 'Vivian', from: 'apartment[owner_id]'
      end
      Then 'I submit the information' do
        click_button 'Create Apartment'
      end
      Then 'I expect to see new apt info' do
        expect(page).to have_content('Apartment was successfully created.')
      end
    end
  end
end
