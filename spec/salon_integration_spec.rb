require 'spec_helper'
Capybara.app = Sinatra::Application


describe('The add new path', {:type => :feature}) do
  it('will add a new stylist and display that stylist in the correct location') do
    visit('/')
    click_button('add_stylist')
    fill_in('stylist_entry', :with => 'Bender')
    click_button('stylist_submit')
    expect(page).to have_content('Bender')
  end
  it('will add a new stylist and display that stylist in the correct location') do
    visit('/')
    click_button('add_client')
    fill_in('client_entry', :with => 'Leela')
    click_button('client_submit')
    expect(page).to have_content('Leela')
  end
end

# describe('The client path', {:type => :feature}) do
#   it('will go to a client page')
