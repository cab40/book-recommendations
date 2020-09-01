
require './lib/models.rb'

# WARNING: this will first delete all data
load_test_data!
Book.create(id: 1, title: "A", author: "Author A")
Book.create(id: 2, title: "B", author: "Author B")
Book.create(id: 3, title: "C", author: "Author C")

User.create(id: 1, name: 'U1')
User.create(id: 2, name: 'U2')
User.create(id: 3, name: 'U3')

Rating.create(user_id: 1, book_id: 1, rating: 5)
Rating.create(user_id: 1, book_id: 2, rating: 0)
Rating.create(user_id: 1, book_id: 3, rating: 1)
Rating.create(user_id: 2, book_id: 1, rating: 4)
Rating.create(user_id: 2, book_id: 2, rating: 4)
Rating.create(user_id: 3, book_id: 1, rating: 5)
Rating.create(user_id: 3, book_id: 2, rating: -5)


 

