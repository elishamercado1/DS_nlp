library(tidyverse)
library(tidytext)
library(SnowballC)  # for stemming
library(textstem)   # for lemmatization

patents <- readr::read_csv("./data/patent.csv")


knitr::kable(head(patents), align = "lccrr")


# 3.1 TOKENISATION --------------------------------------------------------

tidy_patent<-patents %>%
  unnest_tokens(input= abstract,
                output= "word",
                token= "words")
tidy_patent
# Can also do other tokenisation characters, n_gram, sentences, lines, paragraphs, regex

tidy_patent %>%
  count(word, sort= TRUE)


# 3.2 EXERCISE ------------------------------------------------------------

rumi_poem <- c("Do you know what you are?  You are a manuscript of a divine letter .",      
               "22 334 565 343 You are a mirror reflecting a noble face.",      
               "This universe is not outside of you. Look inside yourself." ,    
               "everything that you want 55 43 35,",   
               "you are already that.")

# Creating a tibble 
rumi_poem_df <- tibble(line = 1:length(rumi_poem), text = rumi_poem)

rumi_sentences <- rumi_poem_df |> 
  unnest_tokens(input = text, output = "sentence", token = "sentences")

# 3.3 STOP WORDS ----------------------------------------------------------
stop_words

tidy_patent <-tidy_patent %>%
  anti_join(stop_words, by = "word") # removing stop words
tidy_patent

top_words <- tidy_patent %>%
  count(word, sort = TRUE) %>% #the output has 2 columns word and n (the counts of each word)
  top_n(10) %>% #select the 10 top rows
  mutate(word = reorder(word, n))

top_words

ggplot(top_words, aes(x = word, y = n), group= 1) +
  geom_col(fill = "blue") +
  theme(legend.position = "none", 
        plot.title = element_text(hjust = 0.5),
        panel.grid.major = element_blank()) +
  xlab("") + 
  ylab("Word Count") +
  ggtitle("Most frequently used words ") +
  coord_flip()

# 3.3.1 CUSTOM STOP WORDS
custom_stop_words <- bind_rows(tibble(word = c("includes", "oohhh", "lolllll"), 
                                      lexicon=c("custom")), stop_words)

tidy_patent <-tidy_patent %>%
  anti_join(custom_stop_words, by = "word") # removing stop words
tidy_patent


# 3.4 EXERCISE ------------------------------------------------------------
# Creating a tibble 
rumi_poem_df <- tibble(line = 1:length(rumi_poem), text = rumi_poem)
rumi_poem_df

rumi_words <- rumi_poem_df |> 
  unnest_tokens(input = text, output = "word", token = "words") |> 
  anti_join(stop_words, by = "word")


# 3.5 REMOVING PUNCTUATION ------------------------------------------------
sample_text <- "Let's see How punctuation : , FuNcTiON woRkS ! "
str_replace_all(sample_text, '[[:punct:]]+', ' ')

# tidytext removes punctuation by default when you use unnest_tokens
# SOMETIMES WE WANT TO RETAIN PUNCTUATION! USE STRIP_PUNCT = FALSE PARAMETER FROM UNNEST_TOKENS
one_abstract <- c("!! { } - : A buffing-pad that includes a substantially conventional buffing pad made of tufted wool!",  
                  "that includes: backing plate,  a central hub for attachment to the shaft of a {rotary power buffer} :", 
                  "The pad also carries a plurality of shorter tufts of wool or other fiber of a contrasting color.")

abstract_example <- tibble(line = 1:length(one_abstract), text = one_abstract)
abstract_example

with_punct <- abstract_example %>% 
  unnest_tokens(input= text,
                output= "word",
                token= "words",
                strip_punct=FALSE)

with_punct

without_punct <- abstract_example %>% 
  unnest_tokens(input= text,
                output= "word",
                token= "words")

without_punct


# 3.6 CONVERT TEXT TO LOWERCASE -------------------------------------------
sample_text <- "Let's see How lowercaSe FuNcTiON woRkS ! "
tolower(sample_text) 

# tidytext converts to lower case by default by can switch off by changing parameter to to_lower = FALSE


# 3.7 REMOVING NUMBERS ----------------------------------------------------
number <- tidy_patent %>%
  filter (str_detect(word, "^[0-9]"))

tidy_patent <- tidy_patent%>%
  anti_join(number, by="word")
tidy_patent


# 3.8 EXERCISE ------------------------------------------------------------
rumi_numbers <- rumi_words |> 
  filter(str_detect(word, "^[0-9]"))

rumi_no_numbers <- rumi_words |> 
  anti_join(rumi_no_numbers, by = "word")


# REMOVING WHITESPACES ----------------------------------------------------
tidy_patent<-patents %>%
  unnest_tokens(input= abstract,
                output= "word",
                token= "words")
tidy_patent <- tidy_patent %>%
  str_remove_all(word, "[[:blank:]]")


