require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  subject(:user) { User.create!(email: 'test', password: 'password') }
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content('Create a new account!')
  end

  feature 'signing up a user' do
    
    scenario 'shows username on the show page after signup' do
      visit new_user_url
      fill_in 'Email', with: 'test'
      fill_in 'Password', with: 'password'
      click_on 'Create Account'
      expect(page).to have_content('Your own page')
    end

  end
end

feature 'logging in' do 
  let!(:user) { User.create!(email: 'test', password: 'password') }
  scenario 'shows username on the show page after login' do
    visit new_sessions_url
    fill_in 'Email', with: 'test'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    expect(page).to have_content('Your own page')
    expect(page).to have_content('Currently logged in as') 
  end
end

feature 'logging out' do
  let!(:user) { User.create!(email: 'test', password: 'password') }
  scenario  'begins with a logged out state' do
    visit new_sessions_url   
    expect(page).to have_content('Log in')
  end 

  scenario 'doesn\'t show username on the page after logout' do
    visit new_sessions_url
    fill_in 'Email', with: 'test'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    click_on 'Log out'
    expect(page).to_not have_content('Currently logged in as')    
  end
end