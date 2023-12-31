# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Starting Seeding"
category_dsa = Category.create(name: "dsa")
category_development = Category.create(name: "development")
category_dbms = Category.create(name: "dbms")
course1 = Course.create(category_id: category_dsa, name: "Basics of Programming with C", description: "Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.",
                        price: 200, discount: 20, details_link: "/basics_of_programming_with_c")
course2 = Course.create(category_id: category_dsa, name: "Data Structures & Algorithms with Java", description: "Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.",
                        price: 350, discount: 20, details_link: "/data_structures_and_algorithms_with_java")
course3 = Course.create(category_id: category_dsa, name: "Data Structures & Algorithms with C", description: "Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.",
                        price: 350, discount: 20, details_link: "/data_structures_and_algorithms_with_c")
course4 = Course.create(category_id: category_dsa, name: "Object Oriented Programming with Java", description: "Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.",
                        price: 400, discount: 20, details_link: "/object_oriented_programming_with_java")
course5 = Course.create(category_id: category_development, name: "Web Development with Ruby on Rails", description: "Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.",
                        price: 600, discount: 20, details_link: "/web_development_with_ruby_on_rails")
course6 = Course.create(category_id: category_dbms, name: "RDBMS with Postgresql/MySql", description: "Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.",
                        price: 200, discount: 20, details_link: "/rdbms_with_postgresql")

puts "Seeding done"