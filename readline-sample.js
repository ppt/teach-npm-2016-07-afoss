var numeral = require("numeral"),
  moment = require("moment"),
  now = moment(),
  filename = "md-message1-20160308.log",
  cnt = 0,
  data = "";

console.log(moment().format("HH:mm:ss.SSS"));

var fs = require("fs");
var readline = require("readline");

var instream = fs.createReadStream(filename);
var rl = readline.createInterface(instream,null);

rl.on("line", function(line) {
  cnt = cnt + 1;
  data = JSON.parse(line);
});

rl.on("close", function() {
  console.log(moment().format("HH:mm:ss.SSS"));
  console.log("time = " + moment(moment().diff(now)).format("mm:ss.SSS"));
  console.log("line = " + numeral(cnt).format());
  console.dir(data);
});
