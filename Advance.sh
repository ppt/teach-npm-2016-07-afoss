# create OrderBook message
getmsg md-message1-20160808.json OrderBook > data/OrderBook.json

cat data/OrderBook.json | rmlineno | grep -E 'ADVANC' > ADVANC-Orderbook.json
cat ADVANC-Orderbook.json | statfield displayName
# only 9 fields

cat data/ADVANC-Orderbook.json | node msgbody.js | node removekey.js timeStamp | node removekey.js closingPrice | sort | uniq | sort
# 10 records include ODD Lots same displayName
