# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# NOTE: seed cats
Cat.destroy_all
cat1 = Cat.create!(birth_date: '1986/12/11', color: "orange", name: "Luna", sex: "F", description: "short hair domestic")
cat2 = Cat.create!(birth_date: '1987/03/12', color: 'gray', name: 'Sol', sex: 'M', description: 'Sol is an imaginary cat. He is cool.')
cat3 = Cat.create!(birth_date: '1987/02/17', color: 'black', name: 'Jimmy', sex: 'M', description: 'chubby')


# NOTE: Seed Cat Rental Requests
request1 = CatRentalRequest.create!(cat_id: cat1.id, start_date: '2017/06/15', end_date: '2017/06/17')
request2 = CatRentalRequest.create!(cat_id: cat1.id, start_date: '2017/06/18', end_date: '2017/06/19')
request3 = CatRentalRequest.create!(cat_id: cat1.id, start_date: '2017/06/18', end_date: '2017/06/20')
