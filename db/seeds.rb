# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Directive.create([
  {
    name: 'Someone in Seahawks gear',
    description: 'Go Hawks!',
    complete?: "false",
    point_value: 1,
    hunt_id: 1
  }, {
    name: 'Someone in Sounders gear',
    description: 'Seattle Sounders - MLS Champs 2016!',
    complete?: "false",
    point_value: 1,
    hunt_id: 1
  }, {
    name: 'A fancy mustache',
    description: '',
    complete?: "false",
    point_value: 1,
    hunt_id: 1
  }
])

Hunt.create([
  {
    name: 'Ada First Week Team Building',
    description: 'Explore Seattle and bond with your new classmates at Ada Developers Academy',
    organizer_id: 1,
    passcode: 'AdaLovelaceCodesIt'
  },
  {
    name: 'Mr. Mulligan Fibonacci Finders',
    description: 'How many examples of the Fibonacci series can you find and submit to discuss in class?',
    organizer_id: 2,
    passcode: 'MulliganMathematicians'
  }
  ])
