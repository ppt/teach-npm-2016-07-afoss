"use strict";
// let filename = "data/ADVANC-Orderbook.json";
const rl = require("readline").createInterface({
  input: process.stdin
  // input: require("fs").createReadStream(filename)
});

rl.on("line", function(line){
  let data = JSON.parse(line);
  let op = JSON.stringify(data[Object.keys(data)[2]]);
  console.log(op);
});
