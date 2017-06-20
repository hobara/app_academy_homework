# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

adam = User.create(username:'adam')
hiro = User.create(username:'hiro')
ryan = User.create(username:'ryan')

lady = Artwork.create(image_url: "http://i.imgur.com/CchNQmg.jpg",
  title: "lady", artist_id: adam.id)
tree = Artwork.create(image_url: "http://i.imgur.com/CchNQmg.jpg",
  title: "tree", artist_id: adam.id)
thread = Artwork.create(image_url: "http://i.imgur.com/nx0N6Xx.jpg",
  title: "thread", artist_id: hiro.id)

ArtworkShare.create(artwork_id: lady.id, viewer_id: hiro.id)
ArtworkShare.create(artwork_id: lady.id, viewer_id: ryan.id)
ArtworkShare.create(artwork_id: thread.id, viewer_id: adam.id)
