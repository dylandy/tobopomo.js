#! /usr/bin/env node

require("../lib/tobopomo.js");
var cli = require("cli")

var options = cli.parse({
  tobopomo : [ "b" , "transfrom into Bopomo script" ],
  tokanji : ["k" , "transfrom into Chinese characters"],
  limit:["l", "limit the output characters number"]
});


cli.main(function(argvs , options){
  if (options.tobopomo & options.tokanji && !options.limit){
    console.log(argvs[0].tobopomo().tokanji())
  }else if(options.tobopomo && !options.limit){
    console.log(argvs[0].tobopomo())
  }else if(options.tokanji && !options.limit){
    console.log(argvs[0].tokanji())
  }else if (options.tobopomo & options.tokanji && options.limit){
    console.log(argvs[0].tobopomo().tokanji(argvs[1]))
  }else if(options.tokanji && options.limit){
    console.log(argvs[0].tokanji(argvs[1]))
  }
})
