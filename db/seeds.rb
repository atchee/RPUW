require 'open-uri'
require 'json'

puts "Cleaning up database..."
Game.destroy_all
Theme.destroy_all
Question.destroy_all
Answer.destroy_all
User.destroy_all
puts "Database cleaned"


user_list = [
  { nickname: "Bob", email: 'bob@test.com', password: 'password', password_confirmation: 'password', admin: true },
  { nickname: "Lara", email: 'lara@test.com', password: 'password', password_confirmation: 'password', admin: false },
  { nickname: "Jasper", email: 'jasper@test.com', password: 'password', password_confirmation: 'password', admin: false },
  { nickname: "Diane", email: 'diane@test.com', password: 'password', password_confirmation: 'password', admin: false }
]

user_list.each do |user|
  u = User.create!(user)
  p u
  p 'created 1 user'
end

themes_list = [
  "Literature",
  "General knowledge",
  "Mythology",
  "Movies",
  "Manga & Anime",
  "Sports",
  "History",
  "Geography",
  "Science"
  ]

  themes_list.each do |name|
    theme = Theme.create!(name: name)
    p theme
    p 'created 1 theme'
  end


q_1 = Question.create(content: "In the year 1818, novelist Mary Shelly is credited with writing a fiction novel and creating this infamous character?", theme: Theme.find_by(name: "Literature"))
Answer.create(question: q_1, content: "Frankenstein's monster", correct: true)
Answer.create(question: q_1, content: "The Thing", correct: false)
Answer.create(question: q_1, content: "Dracula", correct: false)
Answer.create(question: q_1, content: "The Invisible Man", correct: false)
q_1.save!
p "created 1 question!"

q_2 = Question.create(content: "Between 1973 to 1990, what country was ruled by dictator Augusto Pinochet?", theme: Theme.find_by(name: "History"))
Answer.create(question: q_2, content: "Chile", correct: true)
Answer.create(question: q_2, content: "Colombia", correct: false)
Answer.create(question: q_2, content: "Nicaragua", correct: false)
Answer.create(question: q_2, content: "Cuba", correct: false)
q_2.save!
p "created 1 question!"


q_3 = Question.create(content: "Which country has the union jack in its flag?", theme: Theme.find_by(name: "Geography"))
Answer.create(question: q_3, content: "New Zealand", correct: true)
Answer.create(question: q_3, content: "South Africa", correct: false)
Answer.create(question: q_3, content: "Canada", correct: false)
Answer.create(question: q_3, content: "Hong Kong", correct: false)
q_3.save!
p "created 1 question!"


q_4 = Question.create(content: "What is the name of the capital of Turkey?", theme: Theme.find_by(name: "Geography"))
Answer.create(question: q_4, content: "Ankara", correct: true)
Answer.create(question: q_4, content: "Istanbul", correct: false)
Answer.create(question: q_4, content: "Izmir", correct: false)
Answer.create(question: q_4, content: "Bursa", correct: false)
q_4.save!
p "created 1 question!"


q_5 = Question.create(content: "Which naval battle was considered the turning point of the Pacific Ocean Theater during World War 2?", theme: Theme.find_by(name: "History"))
Answer.create(question: q_5, content: "Battle of Midway", correct: true)
Answer.create(question: q_5, content: "Attack on Truk Island", correct: false)
Answer.create(question: q_5, content: "Attack on Pearl Harbor", correct: false)
Answer.create(question: q_5, content: "Battle of the Coral Sea", correct: false)
q_5.save!
p "created 1 question!"


q_6 = Question.create(content: "How many differently shaped Tetris pieces are there?", theme: Theme.find_by(name: "General knowledge"))
Answer.create(question: q_6, content: "7", correct: true)
Answer.create(question: q_6, content: "5", correct: false)
Answer.create(question: q_6, content: "6", correct: false)
Answer.create(question: q_6, content: "8", correct: false)
q_6.save!
p "created 1 question!"


q_7 = Question.create(content: "In 1939, Britain and France declared war on Germany after it invaded which country?", theme: Theme.find_by(name: "History"))
Answer.create(question: q_7, content: "Poland", correct: true)
Answer.create(question: q_7, content: "Czechoslovakia", correct: false)
Answer.create(question: q_7, content: "Austria", correct: false)
Answer.create(question: q_7, content: "Hungary", correct: false)
q_7.save!
p "created 1 question!"


q_8 = Question.create(content: "What is the capital of Scotland?", theme: Theme.find_by(name: "Geography"))
Answer.create(question: q_8, content: "Edinburgh", correct: true)
Answer.create(question: q_8, content: "Glasgow", correct: false)
Answer.create(question: q_8, content: "Dundee", correct: false)
Answer.create(question: q_8, content: "London", correct: false)
q_8.save!
p "created 1 question!"


q_9 = Question.create(content: "What was the original name of New York City?", theme: Theme.find_by(name: "General knowledge"))
Answer.create(question: q_9, content: "New Amsterdam", correct: true)
Answer.create(question: q_9, content: "New London", correct: false)
Answer.create(question: q_9, content: "New Hamburg", correct: false)
Answer.create(question: q_9, content: "New Glasgow", correct: false)
q_9.save!
p "created 1 question!"


q_10 = Question.create(content: "Which moon is the only satellite in our solar system to possess a dense atmosphere?", theme: Theme.find_by(name: "Science"))
Answer.create(question: q_10, content: "Titan", correct: true)
Answer.create(question: q_10, content: "Europa", correct: false)
Answer.create(question: q_10, content: "Miranda", correct: false)
Answer.create(question: q_10, content: "Callisto", correct: false)
q_10.save!
p "created 1 question!"


q_11 = Question.create(content: "Who directed the 1973 film 'American Graffiti'?", theme: Theme.find_by(name: "Movies"))
Answer.create(question: q_11, content: "George Lucas", correct: true)
Answer.create(question: q_11, content: "Ron Howard", correct: false)
Answer.create(question: q_11, content: "Francis Ford Coppola", correct: false)
Answer.create(question: q_11, content: "Steven Spielberg", correct: false)
q_11.save!
p "created 1 question!"


q_12 = Question.create(content: "Who won the 2017 Formula One World Drivers' Championship?", theme: Theme.find_by(name: "Sports"))
Answer.create(question: q_12, content: "Lewis Hamilton", correct: true)
Answer.create(question: q_12, content: "Sebastian Vettel", correct: false)
Answer.create(question: q_12, content: "Nico Rosberg", correct: false)
Answer.create(question: q_12, content: "Max Verstappen", correct: false)
q_12.save!
p "created 1 question!"

q_13 = Question.create(content: "Which anime heavily features music from the genre 'Eurobeat'", theme: Theme.find_by(name: "Manga & Anime"))
Answer.create(question: q_13, content: "Initial D", correct: true)
Answer.create(question: q_13, content: "Wangan Midnight", correct: false)
Answer.create(question: q_13, content: "Kino no Tabi", correct: false)
Answer.create(question: q_13, content: "Cowboy Bebop", correct: false)
q_13.save!
p "created 1 question!"

q_14 = Question.create(content: "What is the name of the stuffed lion in Bleach?", theme: Theme.find_by(name: "Manga & Anime"))
Answer.create(question: q_14, content: "Kon", correct: true)
Answer.create(question: q_14, content: "Jo", correct: false)
Answer.create(question: q_14, content: "Urdiu", correct: false)
Answer.create(question: q_14, content: "Chad", correct: false)
q_14.save!
p "created 1 question!"

q_15 = Question.create(content: "Which figure from Greek mythology traveled to the underworld to return his wife Eurydice to the land of the living?", theme: Theme.find_by(name: "Mythology"))
Answer.create(question: q_15, content: "Orpheus", correct: true)
Answer.create(question: q_15, content: "Hercules", correct: false)
Answer.create(question: q_15, content: "Perseus", correct: false)
Answer.create(question: q_15, content: "Daedalus", correct: false)
q_15.save!
p "created 1 question!"

q_16 = Question.create(content: "Hel was the daughter of which Norse Mythological figure?", theme: Theme.find_by(name: "Mythology"))
Answer.create(question: q_16, content: "Loki", correct: true)
Answer.create(question: q_16, content: "Thor", correct: false)
Answer.create(question: q_16, content: "Odin", correct: false)
Answer.create(question: q_16, content: "Balder", correct: false)
q_16.save!
p "created 1 question!"

q_17 = Question.create(content: "This movie contains the quote, 'I feel the need ... the need for speed!'", theme: Theme.find_by(name: "Movies"))
Answer.create(question: q_17, content: "Top Gun", correct: true)
Answer.create(question: q_17, content: "Days of Thunder", correct: false)
Answer.create(question: q_17, content: "The Color of Money", correct: false)
Answer.create(question: q_17, content: "Cocktail", correct: false)
q_17.save!
p "created 1 question!"

q_18 = Question.create(content: "Who in Pulp Fiction says 'No, they got the metric system there, they wouldn't know what the fuck a Quarter Pounder is'", theme: Theme.find_by(name: "Movies"))
Answer.create(question: q_18, content: "Vincent Vega", correct: true)
Answer.create(question: q_18, content: "Jules Winnfield", correct: false)
Answer.create(question: q_18, content: "Jimmie Dimmick", correct: false)
Answer.create(question: q_18, content: "Butch Coolidge", correct: false)
q_18.save!
p "created 1 question!"

q_19 = Question.create(content: "In the novel 'Lord of the Rings', how many rings of power were given to the race of man?", theme: Theme.find_by(name: "Literature"))
Answer.create(question: q_19, content: "9", correct: true)
Answer.create(question: q_19, content: "7", correct: false)
Answer.create(question: q_19, content: "5", correct: false)
Answer.create(question: q_19, content: "12", correct: false)
q_19.save!
p "created 1 question!"

q_20 = Question.create(content: "The asteroid belt is located between which two planets?", theme: Theme.find_by(name: "Science"))
Answer.create(question: q_20, content: "Mars and Jupiter", correct: true)
Answer.create(question: q_20, content: "Jupiter and Saturn", correct: false)
Answer.create(question: q_20, content: "Mercury and Venus", correct: false)
Answer.create(question: q_20, content: "Earth and Mars", correct: false)
q_20.save!
p "created 1 question!"

q_21 = Question.create(content: "Which of these countries remained neutral during World War II?", theme: Theme.find_by(name: "History"))
Answer.create(question: q_21, content: "Switzerland", correct: true)
Answer.create(question: q_21, content: "United Kingdom", correct: false)
Answer.create(question: q_21, content: "France", correct: false)
Answer.create(question: q_21, content: "Italy", correct: false)
q_21.save!
p "created 1 question!"

q_22 = Question.create(content: "Folic acid is the synthetic form of which vitamin?", theme: Theme.find_by(name: "Science"))
Answer.create(question: q_22, content: "Vitamin B", correct: true)
Answer.create(question: q_22, content: "Vitamin A", correct: false)
Answer.create(question: q_22, content: "Vitamin C", correct: false)
Answer.create(question: q_22, content: "Vitamin D", correct: false)
q_22.save!
p "created 1 question!"

q_23 = Question.create(content: "What year did the Vietnam War end?", theme: Theme.find_by(name: "History"))
Answer.create(question: q_23, content: "1975", correct: true)
Answer.create(question: q_23, content: "1978", correct: false)
Answer.create(question: q_23, content: "1967", correct: false)
Answer.create(question: q_23, content: "1969", correct: false)
q_23.save!
p "created 1 question!"

q_24 = Question.create(content: "Which of these Movies was NOT released in 1996?", theme: Theme.find_by(name: "Movies"))
Answer.create(question: q_24, content: "Gladiator", correct: true)
Answer.create(question: q_24, content: "Independence Day", correct: false)
Answer.create(question: q_24, content: "The Rock", correct: false)
Answer.create(question: q_24, content: "Mission: Impossible", correct: false)
q_24.save!
p "created 1 question!"
