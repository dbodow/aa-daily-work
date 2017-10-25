# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

c1 = Cat.create!(birth_date: '1989/05/11', color: :black, name: 'Max', sex: 'M', description: 'Moldovan cat')
c2 = Cat.create!(birth_date: '2015/01/20', color: :savanna, name: 'David', sex: 'F', description: 'Meow, meow, meow')
c3 = Cat.create!(birth_date: '2011/01/01', color: :white, name: 'Luce', sex: 'M', description: 'purrr')

cr1 = CatRentalRequest.create!(cat_id: c1.id, start_date: '2017/10/01', end_date: '2017/10/02')
cr2 = CatRentalRequest.create!(cat_id: c1.id, start_date: '2017/10/03', end_date: '2017/10/04')
cr3 = CatRentalRequest.create!(cat_id: c1.id, start_date: '2017/10/03', end_date: '2017/10/04')
cr4 = CatRentalRequest.create!(cat_id: c2.id, start_date: '2017/10/15', end_date: '2017/10/20', status: 'APPROVED')
