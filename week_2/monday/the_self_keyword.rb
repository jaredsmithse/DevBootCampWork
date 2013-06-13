# no original gist

### Instance Method Context ###
# Let's take the string class. If we were to open it up like so:
  class String
  end

# And put in our own method like this:
  class String
    def my_to_string
      p self
    end
  end

# Here, 'self' is used in the context of an instance method. 
# 'Self' here is essentially saying that we have passed in the current string
# we are working with, by default. This allows us to use the notation:
  "Hello World".my_to_string

# However, if we wanted to use a method not from the String class on the 
# current string object, we would have to use the following notation:
  my_to_string("Hello World")

### Class Method Context ###
# For an example of a class method and how it uses 'self', we can look at the 
# initialize method. To call the initialize method we use #new on the class
# name like this:
  OurClass.new

# which calls the class method 'initialize'. We can define our own class method
# like this:
  class OurClass
    def self.my_class_method
    end
  end

# 'Self' in this context refers to the entire class to which it belongs.
