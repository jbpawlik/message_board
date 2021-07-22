require('capybara/rspec')
require('./app')
require 'simplecov'
SimpleCov.start
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an path', {:type => :feature}) do
  it('goes to the home page') do
    visit('/')
    expect(page).to have_content('Shrimp Talk')
  end
end

describe('create a new board', {:type => :feature}) do
  it('creates a new board and then goes to the boards page') do
    visit('/')
    click_on('Add a New Board')
    fill_in('name', :with => 'Shrimp Biscuit')
    click_on('Get Surfin')
    expect(page).to have_content('Shrimp Biscuit')
  end
end