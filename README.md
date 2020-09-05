# book-recommendations

A common feature in e-commerce platforms is the “customers who liked (item a), also liked (item b)” feature. Based off data used in Michelle Craig’s “Personalized Book Recommendation System” I used Ruby’s ActiveRecord to create a database with the following schema:
```
Books (id, title, author)
Users (id, name)
Ratings (user_id, book_id, rating)
```

I created a Ruby program which reports the book most similar to a specific title based on user ratings. This is done through treating each book’s ratings as a vector and finding the cosine angle between these two vectors. Ratings range from -5 (hated it), to 0 (no rating), to 5 (loved it). As there are cases in which books have different numbers of ratings, the denominator normalizes the score. The formula used is as follows:
 
![Screenshot (55)](https://user-images.githubusercontent.com/69866375/92309376-01481480-ef73-11ea-8f82-0020033c1ef4.png)
<img src="https://user-images.githubusercontent.com/69866375/92309376-01481480-ef73-11ea-8f82-0020033c1ef4.png" width="50%" height="50%>

When a user dislikes or likes both books, a positive amount is contributed to the sum in the numerator, when a user dislikes one and likes another, a negative amount is added to the sum. The greater the score, the more similar the two books.

