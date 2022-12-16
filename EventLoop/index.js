const fs= require("fs")
console.log("start program");


function readFile(callback){
  fs.readFile("./data.json", callback)
}
function readFile1(callback){
  fs.readFile("./data1.json", callback)
}
function readFile2(callback){
  fs.readFile("./data2.json", callback)
}


const timeoutScheduled= Date.now()
setTimeout(function logInfo(){
  const delay= Date.now()- timeoutScheduled
  console.log(`done loginfo: delay ${delay}ms`);
}, 3);

readFile(function readFileAsync(){
  console.log("done readFile");
})
readFile1(function readFileAsync(){
  console.log("done readFile1");
})
readFile2(function readFileAsync(){
  console.log("done readFile2");
})