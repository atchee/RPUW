require 'open-uri'
require 'json'

puts "Cleaning up database..."
Game.destroy_all
Theme.destroy_all
Question.destroy_all
Answer.destroy_all
User.destroy_all
puts "Database cleaned"


user_1 = User.new({ nickname: "Açelya", email: 'Açelya@lewagon.com', password: 'password', password_confirmation: 'password', admin: true })
file = URI.open("https://res.cloudinary.com/alk1805/image/upload/v1654590798/RPUW/avatar-ace_1_wbwvnd.png")
user_1.photo.attach(io: file, filename: "avatar-ace_1_wbwvnd", content_type: "image/png")
user_1.save!
p 'created 1 user'

user_2 = User.new({ nickname: "Sophie", email: 'Sophie@lewagon.com', password: 'password', password_confirmation: 'password', admin: false })
file = URI.open("https://res.cloudinary.com/alk1805/image/upload/v1654590798/RPUW/avatar-sophie_1_xqe3ib.png")
user_2.photo.attach(io: file, filename: "avatar-sophie_1_xqe3ib", content_type: "image/png")
user_2.save!
p 'created 1 user'

user_3 = User.new({ nickname: "Edouard", email: 'Edouard@lewagon.com', password: 'password', password_confirmation: 'password', admin: false })
file = URI.open("https://res.cloudinary.com/alk1805/image/upload/v1654590798/RPUW/avatar-edouard_1_xxoknq.png")
user_3.photo.attach(io: file, filename: "avatar-edouard_1_xxoknq", content_type: "image/png")
user_3.save!
p 'created 1 user'

user_4 = User.new({ nickname: "Adams", email: 'Adams@lewagon.com', password: 'password', password_confirmation: 'password', admin: false })
file = URI.open("https://res.cloudinary.com/alk1805/image/upload/v1654590798/RPUW/avatar-adams_1_iiwkwo.png")
user_4.photo.attach(io: file, filename: "avatar-adams_1_iiwkwo", content_type: "image/png")
user_4.save!
p 'created 1 user'

# user_list.each do |user|
#   u = User.create!(user)
#   p u
#   p 'created 1 user'
# end


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

q_1 = Question.create(content: "En 1818, l'écrivaine Mary Shelly a écrit un roman de fiction et créa quel célebre personnage?", point_value: 2, theme: Theme.find_by(name: "Literature"))
Answer.create(question: q_1, content: "Le monstre de Frankenstein", correct: true)
Answer.create(question: q_1, content: "La Chose", correct: false)
Answer.create(question: q_1, content: "Dracula", correct: false)
Answer.create(question: q_1, content: "L'homme invisible", correct: false)
q_1.save!
p "created 1 question!"

q_2 = Question.create(content: "Entre 1973 et 1990, quel pays fut dirigé par le dictateur Augusto Pinochet?", point_value: 1, theme: Theme.find_by(name: "History"))
Answer.create(question: q_2, content: "Chili", correct: true)
Answer.create(question: q_2, content: "Colombie", correct: false)
Answer.create(question: q_2, content: "Nicaragua", correct: false)
Answer.create(question: q_2, content: "Cuba", correct: false)
q_2.save!
p "created 1 question!"


q_3 = Question.create(content: "Quelle personne, par ses recommandations ou ses conseils, exerce une influence sur le choix d'un produit?", point_value: 1, theme: Theme.find_by(name: "General knowledge"))
Answer.create(question: q_3, content: "Prescripteur", correct: true)
Answer.create(question: q_3, content: "Percepteur", correct: false)
Answer.create(question: q_3, content: "Persifleur", correct: false)
Answer.create(question: q_3, content: "Persécuteur", correct: false)
q_3.save!
p "created 1 question!"


q_4 = Question.create(content: "Qu'elle est la capitale de la Turquie?", point_value: 1, theme: Theme.find_by(name: "Geography"))
Answer.create(question: q_4, content: "Ankara", correct: true)
Answer.create(question: q_4, content: "Istanbul", correct: false)
Answer.create(question: q_4, content: "Izmir", correct: false)
Answer.create(question: q_4, content: "Bursa", correct: false)
q_4.save!
p "created 1 question!"


q_5 = Question.create(content: "Quel compositeur, auteur de l'Arlésienne et Don Procopio est célèbre pour son opéra 'Carmen'?", point_value: 2, theme: Theme.find_by(name: "General knowledge"))
Answer.create(question: q_5, content: "Georges Bizet", correct: true)
Answer.create(question: q_5, content: "Giuseppe Verdi", correct: false)
Answer.create(question: q_5, content: "Gioachino Rossini", correct: false)
Answer.create(question: q_5, content: "Richard Wagner", correct: false)
q_5.save!
p "created 1 question!"


q_6 = Question.create(content: "Combien y a-t-il de pièces différentes dans le jeu Tetris?", point_value: 2, theme: Theme.find_by(name: "General knowledge"))
Answer.create(question: q_6, content: "7", correct: true)
Answer.create(question: q_6, content: "5", correct: false)
Answer.create(question: q_6, content: "6", correct: false)
Answer.create(question: q_6, content: "8", correct: false)
q_6.save!
p "created 1 question!"


q_7 = Question.create(content: "En 1939, la Grande Bretagne et la France déclarent la guerre à l'Allemagne après qu'elle ai débuté l'invasion de quel pays?", point_value: 1, theme: Theme.find_by(name: "History"))
Answer.create(question: q_7, content: "Pologne", correct: true)
Answer.create(question: q_7, content: "Tchécoslovaquie", correct: false)
Answer.create(question: q_7, content: "Autriche", correct: false)
Answer.create(question: q_7, content: "Hongrie", correct: false)
q_7.save!
p "created 1 question!"


q_8 = Question.create(content: "Quelle est la capitale de l'Ecosse?", point_value: 1, theme: Theme.find_by(name: "Geography"))
Answer.create(question: q_8, content: "Edimbourg", correct: true)
Answer.create(question: q_8, content: "Glasgow", correct: false)
Answer.create(question: q_8, content: "Leeds", correct: false)
Answer.create(question: q_8, content: "Londre", correct: false)
q_8.save!
p "created 1 question!"


q_9 = Question.create(content: "Quel était le nom original de la ville de New York?", point_value: 1, theme: Theme.find_by(name: "General knowledge"))
Answer.create(question: q_9, content: "New Amsterdam", correct: true)
Answer.create(question: q_9, content: "New London", correct: false)
Answer.create(question: q_9, content: "New Hamburg", correct: false)
Answer.create(question: q_9, content: "New Glasgow", correct: false)
q_9.save!
p "created 1 question!"


q_10 = Question.create(content: "Quelle lune de notre système solaire possède l'atmosphère la plus dense?", point_value: 1, theme: Theme.find_by(name: "Science"))
Answer.create(question: q_10, content: "Titan", correct: true)
Answer.create(question: q_10, content: "Europa", correct: false)
Answer.create(question: q_10, content: "Miranda", correct: false)
Answer.create(question: q_10, content: "Callisto", correct: false)
q_10.save!
p "created 1 question!"


q_11 = Question.create(content: "Quel est le réalisateur du film 'American Graffiti'?", point_value: 1, theme: Theme.find_by(name: "Movies"))
Answer.create(question: q_11, content: "George Lucas", correct: true)
Answer.create(question: q_11, content: "Ron Howard", correct: false)
Answer.create(question: q_11, content: "Francis Ford Coppola", correct: false)
Answer.create(question: q_11, content: "Steven Spielberg", correct: false)
q_11.save!
p "created 1 question!"


q_12 = Question.create(content: "Quelle bataille menée en 1859 par la France contre l'Autriche contribua à la naissance d'une nation italienne?", point_value: 3, theme: Theme.find_by(name: "History"))
Answer.create(question: q_12, content: "Solférino", correct: true)
Answer.create(question: q_12, content: "Magenta", correct: false)
Answer.create(question: q_12, content: "Marengo", correct: false)
Answer.create(question: q_12, content: "Montebello", correct: false)
q_12.save!
p "created 1 question!"

q_13 = Question.create(content: "Quel film-animé est célèbre pour son utilisation de musique 'Eurobeat'", point_value: 2, theme: Theme.find_by(name: "Manga & Anime"))
Answer.create(question: q_13, content: "Initial D", correct: true)
Answer.create(question: q_13, content: "Wangan Midnight", correct: false)
Answer.create(question: q_13, content: "Kino no Tabi", correct: false)
Answer.create(question: q_13, content: "Cowboy Bebop", correct: false)
q_13.save!
p "created 1 question!"

q_14 = Question.create(content: "Comment s'appelle le lion en peluche dans du manga Bleach?", point_value: 2, theme: Theme.find_by(name: "Manga & Anime"))
Answer.create(question: q_14, content: "Kon", correct: true)
Answer.create(question: q_14, content: "Jo", correct: false)
Answer.create(question: q_14, content: "Ichigo", correct: false)
Answer.create(question: q_14, content: "Chad", correct: false)
q_14.save!
p "created 1 question!"

q_15 = Question.create(content: "Quel personnage de la mythologie Grecque a ramené sa femme Eurydice du monde des enfers?", point_value: 2, theme: Theme.find_by(name: "Mythology"))
Answer.create(question: q_15, content: "Orphée", correct: true)
Answer.create(question: q_15, content: "Hercule", correct: false)
Answer.create(question: q_15, content: "Persée", correct: false)
Answer.create(question: q_15, content: "Dédale", correct: false)
q_15.save!
p "created 1 question!"

q_16 = Question.create(content: "De qui Hel était la fille dans la mythologie nordique?", point_value: 2, theme: Theme.find_by(name: "Mythology"))
Answer.create(question: q_16, content: "Loki", correct: true)
Answer.create(question: q_16, content: "Thor", correct: false)
Answer.create(question: q_16, content: "Odin", correct: false)
Answer.create(question: q_16, content: "Baldr", correct: false)
q_16.save!
p "created 1 question!"

q_17 = Question.create(content: "Qui a découvert la péniciline", point_value: 3, theme: Theme.find_by(name: "Movies"))
Answer.create(question: q_17, content: "Alexander Flemming", correct: true)
Answer.create(question: q_17, content: "Marie Curie", correct: false)
Answer.create(question: q_17, content: "Alfred Nobel", correct: false)
Answer.create(question: q_17, content: "Louis Pasteur", correct: false)
q_17.save!
p "created 1 question!"

q_18 = Question.create(content: "Quel personnage indien dirige le Kwik-E-Mart dans Les Simpson?", point_value: 1, theme: Theme.find_by(name: "Movies"))
Answer.create(question: q_18, content: "Apu Nahasapeemapetilon", correct: true)
Answer.create(question: q_18, content: "Charles Montgomery Burns", correct: false)
Answer.create(question: q_18, content: "Rajesh Koothrappali", correct: false)
Answer.create(question: q_18, content: "Jean Eudes Nallatamby", correct: false)
q_18.save!
p "created 1 question!"

q_19 = Question.create(content: "Dans Le Seigneur des Anneaux, combien d'anneaux furent donnés à la race des hommes?", point_value: 1, theme: Theme.find_by(name: "Literature"))
Answer.create(question: q_19, content: "9", correct: true)
Answer.create(question: q_19, content: "7", correct: false)
Answer.create(question: q_19, content: "5", correct: false)
Answer.create(question: q_19, content: "12", correct: false)
q_19.save!
p "created 1 question!"

q_20 = Question.create(content: "La ceinture d'astéroïdes est située entre quelles plannetes?", point_value: 2, theme: Theme.find_by(name: "Science"))
Answer.create(question: q_20, content: "Mars et Jupiter", correct: true)
Answer.create(question: q_20, content: "Jupiter et Saturn", correct: false)
Answer.create(question: q_20, content: "Mercure et Venus", correct: false)
Answer.create(question: q_20, content: "La Terre et Mars", correct: false)
q_20.save!
p "created 1 question!"

q_21 = Question.create(content: "Lequel de ces pays resta neutre durant la Seconde Guerre Mondiale?", point_value: 1, theme: Theme.find_by(name: "History"))
Answer.create(question: q_21, content: "Suisse", correct: true)
Answer.create(question: q_21, content: "Royaume-Uni", correct: false)
Answer.create(question: q_21, content: "France", correct: false)
Answer.create(question: q_21, content: "Italie", correct: false)
q_21.save!
p "created 1 question!"

q_22 = Question.create(content: "Quelle onomatopée désigne un son faux et discordant produit par la voix ?", point_value: 1, theme: Theme.find_by(name: "General knowledge"))
Answer.create(question: q_22, content: "Couac", correct: true)
Answer.create(question: q_22, content: "Pop", correct: false)
Answer.create(question: q_22, content: "Clic", correct: false)
Answer.create(question: q_22, content: "Ouf", correct: false)
q_22.save!
p "created 1 question!"

q_23 = Question.create(content: "En quelle année eu lieu la bataille d'Austerlitz?", point_value: 2, theme: Theme.find_by(name: "History"))
Answer.create(question: q_23, content: "1805", correct: true)
Answer.create(question: q_23, content: "1790", correct: false)
Answer.create(question: q_23, content: "1815", correct: false)
Answer.create(question: q_23, content: "1825", correct: false)
q_23.save!
p "created 1 question!"

q_24 = Question.create(content: "Lequel de ces films n'est PAS sorti en 1996?", point_value: 2, theme: Theme.find_by(name: "Movies"))
Answer.create(question: q_24, content: "Gladiator", correct: true)
Answer.create(question: q_24, content: "Independence Day", correct: false)
Answer.create(question: q_24, content: "The Rock", correct: false)
Answer.create(question: q_24, content: "Mission: Impossible", correct: false)
q_24.save!
p "created 1 question!"

q_25 = Question.create(content: "Quel personnage prénommé Balthazar est l’oncle maternel de Donald Duck?", point_value: 1, theme: Theme.find_by(name: "Literature"))
Answer.create(question: q_25, content: "Picsou", correct: true)
Answer.create(question: q_25, content: "Gontran", correct: false)
Answer.create(question: q_25, content: "Gripsou", correct: false)
Answer.create(question: q_25, content: "Flairsou", correct: false)
q_25.save!
p "created 1 question!"

q_26 = Question.create(content: "En géométrie, quel adjectif qualifie un angle de 180°?", point_value: 1, theme: Theme.find_by(name: "Science"))
Answer.create(question: q_26, content: "Plat", correct: true)
Answer.create(question: q_26, content: "Droit", correct: false)
Answer.create(question: q_26, content: "Aigus", correct: false)
Answer.create(question: q_26, content: "Obtus", correct: false)
q_26.save!
p "created 1 question!"

q_27 = Question.create(content: "A qui, considéré comme le père de la chimie modèrne est attribué la célèbre phrase 'Rien ne se perd, rien ne se crée, tout se transforme'?", point_value: 3, theme: Theme.find_by(name: "Science"))
Answer.create(question: q_27, content: "Antoine Lavoisier", correct: true)
Answer.create(question: q_27, content: "Louis Pasteur", correct: false)
Answer.create(question: q_27, content: "Dmitri Mendeleïev", correct: false)
Answer.create(question: q_27, content: "Alfred Nobel", correct: false)
q_27.save!
p "created 1 question!"

q_28 = Question.create(content: "Quel est l'élément le plus présent dans l'univers?", point_value: 1, theme: Theme.find_by(name: "Science"))
Answer.create(question: q_28, content: "L'Hydrogène", correct: true)
Answer.create(question: q_28, content: "L'Hélium", correct: false)
Answer.create(question: q_28, content: "Le Lithium", correct: false)
Answer.create(question: q_28, content: "L'Oxygen", correct: false)
q_28.save!
p "created 1 question!"

q_29 = Question.create(content: "Quelle entreprise Japonaise est le premier fabricant au monde de motocycles?", point_value: 2, theme: Theme.find_by(name: "General knowledge"))
Answer.create(question: q_29, content: "Honda", correct: true)
Answer.create(question: q_29, content: "Yamaha", correct: false)
Answer.create(question: q_29, content: "Suzuki", correct: false)
Answer.create(question: q_29, content: "Kawasaki", correct: false)
q_29.save!
p "created 1 question!"

q_30 = Question.create(content: "Qui est le réalisateur du film Kill Bill?", point_value: 1, theme: Theme.find_by(name: "Movies"))
Answer.create(question: q_30, content: "Quentin Tarantino", correct: true)
Answer.create(question: q_30, content: "Arnold Schwarzenegger", correct: false)
Answer.create(question: q_30, content: "David Lean", correct: false)
Answer.create(question: q_30, content: "Stanley Kubrick", correct: false)
q_30.save!
p "created 1 question!"

q_31 = Question.create(content: "Qui est le seul dieu Grecque à ne pas avoir vu son nom changer dans la Rome antique?", point_value: 2, theme: Theme.find_by(name: "Mythology"))
Answer.create(question: q_31, content: "Apollon", correct: true)
Answer.create(question: q_31, content: "Déméter", correct: false)
Answer.create(question: q_31, content: "Zeus", correct: false)
Answer.create(question: q_31, content: "Athena", correct: false)
q_31.save!
p "created 1 question!"

q_32 = Question.create(content: "Lors du siège de Paris par les prussiens en 1870, par quel moyen le ministre Gambetta traverse-t-il les lignes ennemies? ", point_value: 2, theme: Theme.find_by(name: "History"))
Answer.create(question: q_32, content: "En montgolfière", correct: true)
Answer.create(question: q_32, content: "Déguisé en prussien", correct: false)
Answer.create(question: q_32, content: "Dans un tunnel", correct: false)
Answer.create(question: q_32, content: "En train", correct: false)
q_32.save!
p "created 1 question!"

q_33 = Question.create(content: "De quel pays Kuala Lumpur est la capitale?", point_value: 1, theme: Theme.find_by(name: "Geography"))
Answer.create(question: q_33, content: "Malaysie", correct: true)
Answer.create(question: q_33, content: "Indonesie", correct: false)
Answer.create(question: q_33, content: "Singapour", correct: false)
Answer.create(question: q_33, content: "Thaïlande", correct: false)
q_33.save!
p "created 1 question!"

q_34 = Question.create(content: "Quel élément, lorsqu'il est soumit à une chaleur et une pression extrème, crée le diamant?", point_value: 1, theme: Theme.find_by(name: "Science"))
Answer.create(question: q_34, content: "Carbone", correct: true)
Answer.create(question: q_34, content: "Nitrogène", correct: false)
Answer.create(question: q_34, content: "Oxygène", correct: false)
Answer.create(question: q_34, content: "Hydrogène", correct: false)
q_34.save!
p "created 1 question!"

q_35 = Question.create(content: "Lequel de ces termes japonais désigne un système de médecine alternative et signifie litéralement 'pression des doigts'?", point_value: 1, theme: Theme.find_by(name: "Science"))
Answer.create(question: q_35, content: "Shiatsu", correct: true)
Answer.create(question: q_35, content: "Ukiyo", correct: false)
Answer.create(question: q_35, content: "Majime", correct: false)
Answer.create(question: q_35, content: "Ikigai", correct: false)
q_35.save!
p "created 1 question!"

q_36 = Question.create(content: "Qu'était la 'pascaline', nommé en 1642 par Blaise Pascal?", point_value: 3, theme: Theme.find_by(name: "General knowledge"))
Answer.create(question: q_36, content: "La première machine à calculer", correct: true)
Answer.create(question: q_36, content: "Une formule mathématique", correct: false)
Answer.create(question: q_36, content: "Un composé chimique", correct: false)
Answer.create(question: q_36, content: "Une boisson", correct: false)
q_36.save!
p "created 1 question!"

q_37 = Question.create(content: "Qui est le véritable gagnant du tournoi de code 2022 du Wagon?", point_value: 1, theme: Theme.find_by(name: "General knowledge"))
Answer.create(question: q_37, content: "Tim pour le batch #861", correct: true)
Answer.create(question: q_37, content: "Un tricheur du batch Data", correct: false)
Answer.create(question: q_37, content: "Le batch #860", correct: false)
Answer.create(question: q_37, content: "Jar Jar le Quetar", correct: false)
q_37.save!
p "created 1 question!"

q_38 = Question.create(content: "Combien de côtés compte un trapèze?", point_value: 1, theme: Theme.find_by(name: "Science"))
Answer.create(question: q_38, content: "4", correct: true)
Answer.create(question: q_38, content: "3", correct: false)
Answer.create(question: q_38, content: "5", correct: false)
Answer.create(question: q_38, content: "6", correct: false)
q_38.save!
p "created 1 question!"

q_39 = Question.create(content: "Le film de 1996 'Fargo' se déroule principalement dans quel état des USA?", point_value: 1, theme: Theme.find_by(name: "Movies"))
Answer.create(question: q_39, content: "Minnesota", correct: true)
Answer.create(question: q_39, content: "Dakota du Nord", correct: false)
Answer.create(question: q_39, content: "Dakota du Sud", correct: false)
Answer.create(question: q_39, content: "Wisconsin", correct: false)
q_39.save!
p "created 1 question!"

q_40 = Question.create(content: "Quel pays partage la plus longue frontière continue avec la France?", point_value: 1, theme: Theme.find_by(name: "Geography"))
Answer.create(question: q_40, content: "Brésil", correct: true)
Answer.create(question: q_40, content: "Espagne", correct: false)
Answer.create(question: q_40, content: "Belgique", correct: false)
Answer.create(question: q_40, content: "Suisse", correct: false)
q_40.save!
p "created 1 question!"

# q_44 = Question.create(content: "On a dartboard, what number is directly opposite No. 1?", theme: Theme.find_by(name: "General Knowledge"))
# Answer.create(question: q_44, content: "19", correct: true)
# Answer.create(question: q_44, content: "20", correct: false)
# Answer.create(question: q_44, content: "12", correct: false)
# Answer.create(question: q_44, content: "15", correct: false)
# q_44.save!
p "created 1 question!"
