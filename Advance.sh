# create OrderBook message
getmsg md-message1-20160808.log OrderBook > data/OrderBook.json
grep -E 'ADVANC' data/OrderBook.json | relineno > data/ADVANC-Orderbook.json

cat data/ADVANC-Orderbook.json | statfield displayName
# only 9 fields

cat data/ADVANC-Orderbook.json | node msgbody.js | node removekey.js timeStamp | node removekey.js closingPrice | sort | uniq | sort > data/ADVANC-unique.json
# 10 records include ODD Lots same displayName
