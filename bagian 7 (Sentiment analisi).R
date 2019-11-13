
hasil_pencarian_topik
hasil_tweets = plain_tweets(hasil_pencarian_topik$text)

opinion.lexicon.pos = scan("positive.txt", what = "character", comment.char = ";")
opinion.lexicon.neg = scan("negative.txt", what = "character", comment.char = ";")

pos.words = c(opinion.lexicon.pos)
neg.words = c(opinion.lexicon.neg)

getSentimentScore = function(sentences, pos.words, neg.words, .progress = "none")
{
  require(plyr)
  require(stringr)
  scores = laply(sentences, function(sentence, pos.words, neg.words) {
    #remove digit, punctuation, dan special/control character:
    sentence = gsub("[[:cntrl:]]", "", gsub("[[:punct:]]", "", gsub("\\d+", "", sentence)))
    #convert semua teks menjadi lowercase:
    sentence = tolower(sentence)
    #pisahkan setiap kalimat menggunakan spasi (space delimiter):
    words = unlist(str_split(sentence, "\\s+"))
    #lakukan boolean match dari setiap kata-kata menggunakan pos &amp;amp;amp; neg opinion-lexicon:
    pos.matches = !is.na(match(words, pos.words))
    neg.matches = !is.na(match(words, neg.words))
    #score sentimen = total positive sentiment - total negative:
    score = sum(pos.matches) - sum(neg.matches)
    return(score)
  }, pos.words, neg.words, .progress=.progress)
  #return data frame berisi kalimat beserta sentimennya:
  return(data.frame(text = sentences, score = scores))
}

hasil_sentiment = getSentimentScore(hasil_tweets, pos.words, neg.words)
hist(hasil_sentiment$score)
