puts 'Creating nouns'
100.times do
  name = Faker::Hacker.noun
  Noun.create(name: name) unless Noun.exists?(name: name)
end

puts 'Creating verbs'
100.times do
  name = Faker::Hacker.verb
  Verb.create(name: name) unless Verb.exists?(name: name)
end