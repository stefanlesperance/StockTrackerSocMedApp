# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


	User.create(email: "Test1@Test.com", first_name: "Andromache", last_name: "Hope", password: "password")
	User.create(email: "Test2@Test.com", first_name: "Aeneas", last_name: "Anchises", password: "password")
	User.create(email: "Test3@Test.com", first_name: "Cassandra", last_name: "Costeau", password: "password")
	User.create(email: "Test4@Test.com", first_name: "Helen", last_name: "Of Troy", password: "password")
	User.create(email: "Test5@Test.com", first_name: "Priam", last_name: "Troy", password: "password")