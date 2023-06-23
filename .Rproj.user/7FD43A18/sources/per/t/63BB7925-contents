library(stringr)

# 3. BASE R FUNCTIONS -----------------------------------------------------


example_one <-  c("I like NLP", 
                  "Regular expression looks complicated", 
                  "Regular expression looks complicated", 
                  "NLP")

grep(pattern = "NLP", example_one)
# [1] 1 4
# Returns expression number that contains the match

grepl(pattern = "NLP", example_one)
# [1]  TRUE FALSE FALSE  TRUE

example_two <- c("we are looking at different regex", "i am enjoying it", "it looks looking fun now")
regexpr(pattern = "look", example_two)

# [1]  8 -1  4
## Gives position where first matched in the text
# attr(,"match.length")
# [1]  4 -1  4
## Length of the match
# attr(,"index.type")
# [1] "chars"
# attr(,"useBytes")
# [1] TRUE
## represents whether matching was done byte by byte or character by character
### Only matches the first instance in each phrase --> resolve by using gregexpr (performs matching on a global scale:

gregexpr(pattern = "look", example_two)
# [[1]]
# [1] 8
# attr(,"match.length")
# [1] 4
# attr(,"index.type")
# [1] "chars"
# attr(,"useBytes")
# [1] TRUE
# 
# [[2]]
# [1] -1
# attr(,"match.length")
# [1] -1
# attr(,"index.type")
# [1] "chars"
# attr(,"useBytes")
# [1] TRUE
# 
# [[3]]
# [1]  4 10
# attr(,"match.length")
# [1] 4 4
# attr(,"index.type")
# [1] "chars"
# attr(,"useBytes")
# [1] TRUE


# 3.2 Exercise  -----------------------------------------------------------

exercise <- c("abc@ons.gov.uk", "ttt@mod.gov.uk", "abc@hotmail.com", "nna@gmail.com", "adead@ons ons.uk") 
grepl("ons", exercise, ignore.case = TRUE)
string_position <- gregexpr("ons", exercise, ignore.case = TRUE)


# 6. CHARACTER SET --------------------------------------------------------

test <- c ("tin", "tan", "tun", "ton", "ten")

str_view( test, "t[aeiou]n")

test <- c ("tin", "tan", "turn", "tain","t.n", "tennis" )

str_view(test, "t[aeiou]n")


# 7. EXERCISE -------------------------------------------------------------
character_set_example <- c ("is there any solution?", ".[{(^$|?*+", "coreyms.com",  
                            "321-555-4321", "123.555.1234", "This is an awesome album")

str_view(character_set_example, "[0-9]")
# Match any non alpha-numeric character
str_view(character_set_example, "[^0-9a-zA-Z]")

#^ at the start of a character set excludes the next characters, 
# at the end of a character set it just represents itself
caret_end <- c(1,5,7,"hello", "22", "testing","^")
str_view(caret_end, "[0-9^]")


# 8. CHARACTER CLASSES ----------------------------------------------------
character_class_example <- c("We are learning How regex works", "lets see", "testing", "hello world", "2011", "7687687", "Bank holiday 2021")
str_view(character_class_example, "\\s")

# 8.1 EXERCISE
example_three_character <- c(1,2,544,"654")
str_view(example_three_character, "[0-9]{2}")

# 9 POSIX CHARACTER CLASS -------------------------------------------------
# POSIX character classes are predefined sequences for a certain set of characters.
# Double brackets are needed
posix_example <- c(1,55,7,"hello", "22", "apple", "banana", "pear","^")
str_replace_all(posix_example, "[[:digit:]]", "testing")
str_replace(posix_example, "[[:digit:]]", "testing")

# 9.1 EXERCISE
posix_exercise <- c("Hello, world!", "This is bliss", "321-555-4321", "it is    raining")
str_replace_all(posix_exercise, "[[:space:]]", "")


# 10. ANCHORS --------------------------------------------------------------
top_university <- c("Harvard University", "University of Cambridge", "Columbia University", "University of Oxford", "Yale University", "Stanford University") 

str_view_all(top_university, ("^University"))

str_view_all(top_university, ("University$"))


# 11. EXERCISE ------------------------------------------------------------
email_exercise <- c("abc@ons.gov.uk", "ttt@mod.gov.uk", "abc@hotmail.com", 
                    "nna@gmail.com", "adead@ons.uk") 

str_view_all(email_exercise, ("@ons.gov.uk$"))

# 12.1 EXERCISE
quantifier_exercise <- c(" I bought 2 tickets 2-613-213-4567 or 5555555555",
                         "43 Apple Rd, Orange QC POA 5RQ - 613 321 4567", 
                         "contact Dr who (613)2134567",
                         "1.575.555.5555 is  #1 number",  
                         "7164347566",
                         " 1234567 cats"
)

str_view_all(quantifier_exercise, "([0-9]|.|\\(|\\)|-|\\s){5}+")
