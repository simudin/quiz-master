require 'rails_helper'

RSpec.feature "Question", :type => :feature do
  scenario "Create a new question" do
    visit "/questions/new"

    fill_in "Content", :with => "Who is the president of Indonesia?"
    fill_in "Answer", :with => "Joko Widodo"

    click_button "Create Question"

    expect(page).to have_text("Who is the president of Indonesia?")
  end
end
