require('capybara/rspec')
require('./app')
require 'simplecov'
SimpleCov.start
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an path', {:type => :feature}) do
  it('creates an album and then goes to the album page') do
    visit('/boards')
    expect(page).to have_content('test')
  end
end