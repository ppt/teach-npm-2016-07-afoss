# source msg.sh

function portion() {
  # bash expression : $(( expression ))
  # $1 : 1st parameter
  head -n$(($3)) $1 | tail -n+$2
}

# " bash interpret escape char .e.g $1 first parameter
# ' not interpret escape char
function msgstat() {
  # grep -o : output only result, -E : expression
  # cut -c12- : cut first 12 characters
  # uniq -c : count similar lines
  # sort -nr : sort number descending
  grep -o -E "\"mesgType\":\"\w+\"" $1 | cut -c12- | sort | uniq -c | sort -nr
}

function getmsg() {
  # grep -n : output line number, "..." : interpret $1 cannot use '...'
  grep -n -E "\"mesgType\":\"$2\"" $1
}

function countline() {
  # Usage : countline < filename
  wc -l
}

function rmlineno() {
  # cut -d : delimiter, -f : field we want
  # Usage : rmlineno < filename
  cut -d':' -f2-
}

function statfield() {
  # Usage : statfield typeOfStateEvent OrderBookStateChangeEvent.json
  grep -o -E "\"$1\":[^,]+" $2 | sort | uniq -c | sort -nr
}

function dumpfield() {
  # ' not interpret escape char
  # Usage : dumpfield '"newState":"Startup"' OrderBookStateChangeEvent.json
  grep -E $1 $2
}

function dump1stline() {
  # head -n 1 : list only one line
  # Usage : dump1stline '"newState":"Startup"' OrderBookStateChangeEvent.json
  grep -E $1 $2 | head -n 1
}
