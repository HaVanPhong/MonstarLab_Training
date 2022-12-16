var promise= new Promise((rs, rj)=>{
  let rd= Math.random()
  setTimeout(
    ()=>{
      if (rd){
        rs("success")
      }else {
        rj("errr")
      }
    }
    , 2000
  )
  console.log(rd);
})
var promise1= new Promise((rs, rj)=>{
  let rd= Math.random()
  setTimeout(
    ()=>{
      if (rd){
        rs("success1")
      }else {
        rj("errr1")
      }
    }
    , 1000
  )
  console.log(rd);
})
var promise2= new Promise((rs, rj)=>{
  let rd= Math.random()
  setTimeout(
    ()=>{
      if (rd){
        rs("success2")
      }else {
        rj("errr2")
      }
    }
    , 4000
  )
  console.log(rd);
})

promise
  .then((mess)=>console.log(mess)) 
  .catch((mess)=> console.log(mess))
  .finally(()=> console.log("done"))
promise1
  .then((mess)=>console.log(mess)) 
  .catch((mess)=> console.log(mess))
  .finally(()=> console.log("done"))
promise2
  .then((mess)=>console.log(mess)) 
  .catch((mess)=> console.log(mess))
  .finally(()=> console.log("done"))

console.log("hha");  