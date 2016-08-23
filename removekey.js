"use strict";
// let filename = "data/ADVANC-Orderbook.json";
const rl = require("readline").createInterface({
  input: process.stdin
  // input: require("fs").createReadStream(filename)
});

rl.on("line", function(line){
  let data = JSON.parse(line);
  delete data[process.argv[2]];
  let op = JSON.stringify(data);
  console.log(op);
});
