require 'spec_helper'
require 'launchy'
Capybara.app = Sinatra::Application


describe('The add new path', {:type => :feature}) do
  it('will add a new stylist and display that stylist in the correct location') do
    visit('/')
    click_button('add_stylist')
    fill_in('stylist_entry', :with => 'Bender')
    click_button('stylist_submit')
    expect(page).to have_content('Bender')
  end
  it('will add a new client and display that client in the correct location') do
    visit('/')
    click_button('add_client')
    fill_in('client_entry', :with => 'Leela')
    click_button('client_submit')
    expect(page).to have_content('Leela')
  end
end

describe('The client path', {:type => :feature}) do
  it('will go to a client page and delete client') do
    visit('/index/new/client')
    fill_in('client_entry', :with => 'Leela')
    click_button('client_submit')
    click_on('Leela')
    click_button('delete_client')
    expect(page).to_not have_content('Leela')
  end
end
