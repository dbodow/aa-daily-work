require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'New User'
  end

  feature 'signing up a user' do

    before(:each) do
      visit new_user_url
      fill_in 'username', with: 'waffles'
      fill_in 'password', with: 'hello_world'
      click_on 'Create User'
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content 'waffles'
    end

  end
end

feature 'logging in' do

  subject!(:waffles) { FactoryBot.create(:user) }

  scenario 'shows username on the homepage after login' do
    visit new_session_url
    fill_in 'username', with: 'waffles'
    fill_in 'password', with: 'hello_world'
    click_on 'Log In'
    save_and_open_page
    expect(page).to have_content 'waffles'
  end
  # @waffles = FactoryBot.create(:user)
  #
  # scenario 'shows username on the homepage after login' do
  #   visit new_session_url
  #   fill_in 'username', with: @waffles.username
  #   fill_in 'password', with: @waffles.password
  #   click_on 'Log In'
  #   expect(page).to have_content 'waffles'
  # end

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end
