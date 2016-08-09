function portion() {
  # bash expression : $(( expression ))
  # $1 : 1st parameter
  head -n$(($3+1)) $1 | tail -n+$2
}

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
  wc -l
}

function rmlineno() {
  # cut -d : delimiter, -f : field we want
  # Usage : rmlineno < filename
  cut -d':' -f2-
}
