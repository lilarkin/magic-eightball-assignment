require 'pry'

option = ARGV[0].strip 
case (option)
  when 'add_answer'
    add_answer
  when 'reset_answer'
    reset_answers
  when 'print_answers'
    print_answers
end

puts 'Welcome to the Magic Eightball!'

@answers = ['Your face.', 'No one likes you, go home.', 
            'Yo mama\'s so fat...', 'Don\'t ask.', 'Get a room.',
            'It\'s got its own weather system.', 'Toe pick.', 
            'Like a tremor in the force.', 'you remind me of the babe.']
@added_answers = []

def add_answer
  puts 'You must answer your own question.'
  sleep(0.5)
  puts 'What is your answer?'
  answer = $stdin.gets.chomp
  @added_answers << answer
end

def reset_answers
  puts 'You won THIS lottery'
  sleep(0.5)
  puts 'Magic Eightball answers have all been reset.'
  sleep(1)
  puts 'What a shitty lottery!'
  @added_answers = []
end

def print_answers
  puts 'You might not be pretty, but here are all the answers:'
  sleep(1)
  puts [@answers, @added_answers.uniq].flatten
end

def play_the_game
  question = $stdin.gets.chomp
  secret_question = /what is my future\??/ =~ question.downcase 
  secret_question2 = /will i win the lottery\??/ =~ question.downcase
  secret_question3 = /am i pretty\??/ =~ question.downcase
  if !secret_question.nil?
    add_answer
  elsif !secret_question2.nil?
    reset_answers
  elsif !secret_question3.nil?
    print_answers
  elsif question.downcase != 'quit'
    answer = [@answers, @added_answers.uniq].flatten.sample
    puts answer
  else 
    puts 'Thanks for playing the Magic Eightball. Please play again!'
    exit(0) 
  end
end

while true
  sleep(0.5)  
  puts 'Type a question to get an answer, or type QUIT to quit the program.'
  play_the_game
end

