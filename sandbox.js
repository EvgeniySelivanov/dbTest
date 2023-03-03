// async function test() {
//   return 'test';
// }


// const t1 = test();
// console.log(t1);
// t1.then((data) => console.log(data));

async function getData() {
  // const res= fetch().then();
  const res = await fetch("https://randomuser.me/api/?results=2");
  // const data =  res.json().then();
  const data = await res.json();
  return data;
} 

async function workWithUser(){
  try{
    const users=await getData();
    console.log(users);
    return;
  }catch(error){
console.log(error);
  }
  
  
} 
workWithUser();