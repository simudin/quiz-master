require 'rails_helper'

RSpec.feature "Question", :type => :feature do
  scenario "Create a new question" do
    visit "/questions/new"

    fill_in "Content", :with => "Who is the president of Indonesia?"
    fill_in "Answer", :with => "Joko Widodo"

    click_button "Create Question"

    expect(page).to have_text("Who is the president of Indonesia?")
  end

  scenario "answer right question and to the next question" do
  	question = Question.create!({content: 'Who is the president of Indonesia?', answer: 'Joko Widodo'})
  	question2 = Question.create!({content: '1 + 1 = ?', answer: '2'})
    visit "/features/quiz?id=#{question.id}"

    fill_in "question[answer]", :with => "Joko Widodo"

    click_button "WATAAA!"

    expect(page).to have_text("You are right!")
  end

  scenario "finish the quiz" do
  	question = Question.create!({content: 'Who is the president of Indonesia?', answer: 'Joko Widodo'})
    visit "/features/quiz?id=#{question.id}"

    fill_in "question[answer]", :with => "Joko Widodo"

    click_button "WATAAA!"

    expect(page).to have_text("You finish the quiz!")
  end

  scenario "game over" do
  	page.set_rack_session(:lives => 1)
  	question = Question.create!({content: 'Who is the president of Indonesia?', answer: 'Joko Widodo'})
    visit "/features/quiz?id=#{question.id}"

    fill_in "question[answer]", :with => "Hillary Clinton"

    click_button "WATAAA!"

    expect(page).to have_text("Uh oh.. Game Over!")
  end
end
