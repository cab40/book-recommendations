require './lib/models.rb' # Give us access to the database, see file for info

# Given a book_id, returns the number of 
# users that have given it a non zero rating

def num_non_zero_ratings book_id
    a = Rating.book_ratings_array(book_id)
    count=0
    i = 0
    
    while i < a.length()
        if a[i]!=0
            count+=1
        end
        i+=1
    end
    
    return count

end


# given a book_id, returns the book's average rating
# for all non-zero ratings

def average_book_rating book_id
    a = Rating.book_ratings(book_id)
    i = 0
    sum = 0
    
    while i < a.length()
        sum += Integer(a.values[i])
        i+=1
    end
    
    return (sum.to_f / a.length())
end


# Given two book_id's, compute and return the cosine similarity
# between the two books.  If a book has no non-zero
# ratings, the similarity is zero.  

def max (a,b)
  a>b ? a : b
end

def similarity (book_a, book_b)
    b1 = Rating.book_ratings(book_a)
    b2 = Rating.book_ratings(book_b)
    ub1 = 0 #user book 1
    ub2 = 0 #user book 2
    numerator = 0
    denominator = 0
    
#compute numerator
    i=0
    biglad = max(b1.length(), b2.length())
    while ub1 < biglad.to_i && ub2 < biglad.to_i
        if b1.keys[ub1] == b2.keys[ub2]
            numerator += (b1.values[ub1] * b2.values[ub2])
            ub1 += 1
            ub2 += 1
        elsif (b1.keys[ub1]).to_i > (b2.keys[ub2]).to_i
            ub2 += 1
        elsif (b1.keys[ub1]).to_i < (b2.keys[ub2]).to_i
            ub1 += 1
        end 
    end
=begin
        This is to ensure that the book ratings are by the same user. It checks that the user is the same for both
        books. If the user is the same, it adds the product of the ratings to the sum. If the users are not the same,
        it increases the user with a lesser # by 1 until the users are the same. Doing this essentially skips
        over any user that hasn't rated both books.
=end
    
#compute denominator
    sumb1 = 0.0
    sumb2 = 0.0
    
    i = 0
    while i < b1.length()
        sumb1 += (b1.values[i])**2
        i+=1
    end
    i = 0
    while i < b2.length()
        sumb2 += (b2.values[i])**2
        i+=1
    end
    denominator = (Math.sqrt(sumb1))*(Math.sqrt(sumb2))
=begin
        Get sum of all the book 1 ratings squared then get the sum of all the book 2 ratings squared.
        Multiply the square root of these 2 sums to get the denominator
=end
    
    return numerator/denominator
end


    

