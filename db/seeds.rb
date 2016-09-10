# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  questions = Question.create([{ content: 'Who is the president of Indonesia?', answer: 'Joko Widodo'}, { content: '5 x 5 = ?', answer: '25'}])
  puts "Default questions created."
  Question.all.each do |question|
  	puts "Content: #{question.content}"
  	puts "Answer: #{question.answer}"
  	puts "=============================="
  end