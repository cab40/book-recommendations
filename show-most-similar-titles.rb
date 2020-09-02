

require './lib/book-recsys.rb'

def format_similar_message source_book_title, most_similar_title, similarity_score
  return "People who liked #{source_book_title}," +
    " also liked #{most_similar_title}." +
    " (Score = %0.3f)" % [similarity_score]
end

books = Book.get_ids()
books.sort #now book ids are sorted
len = books.length()

for i in (1..len)
    biggestScore = 0.0
    title = 1
    for j in (1..len)
        if similarity(i, j) > biggestScore && i!=j
            biggestScore = similarity(i, j)
            title = j
        end
    end
    puts(format_similar_message(Book.get_title(i), Book.get_title(title), biggestScore))
end
    
         



