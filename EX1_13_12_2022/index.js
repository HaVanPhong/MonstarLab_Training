//Bai 1
const arr= [
  { name: 'name1', age: 12 },
  { name: 'name2', age: 20 },
  { name: 'name3', age: 15 },
  { name: 'name4', age: 10 },
  { name: 'name4', age: 27 }
]

function sortByAgeDesc(o1, o2){
  return o2.age-o1.age
}

arr.sort(sortByAgeDesc)

// console.log(arr);

//Bai 2
const arrName= arr.map(value=> {
  return value.name
})
// console.log(arrName);

//Bai 3
const arr3= new Array(100)
arr3.fill(0)
for (let i=0; i<100; i++){
  arr3[i]=i;
}
const copyArr3= arr3.slice()

const arrDivisibleBy5= copyArr3.filter((value, index)=> {
  const check= value%5===0;
  // if (check){
  //   copyArr3.splice(index, 1)
  // }
  check && copyArr3.splice(index, 1)
  return check;
})

const sumRemainNumbers= copyArr3.reduce((pre, cur)=>{
  return pre+cur;
}, 0)

// console.log("Array divisible by 5: ");
// console.log(arrDivisibleBy5);

// console.log("Array ramaning numbers: ");
// console.log(copyArr3);

// console.log("Sum remain numbers: ");
// console.log(sumRemainNumbers);


//Bai 4
const arr4= [
  { name: 'name1', count: 13 },
  { name: 'name3', count: 23 },
  { name: 'name1', count: 25 },
  { name: 'name2', count: 27 },
  { name: 'name3', count: 30 },
  { name: 'name2', count: 20 }
]

const newArr4=[]
for (let element of arr4){
  let indexExists= newArr4.findIndex((value)=> value.name===element.name)
  if (indexExists!==-1){
    newArr4[indexExists].count+= element.count
  }else {
    newArr4.push(element)
  }
}
// console.log(newArr4);







/*
Bài 1: Sắp xếp mảng sau theo thứ tự độ tuổi giảm dần
[
  { name: 'name1', age: 12 },
  { name: 'name2', age: 20 },
  { name: 'name3', age: 15 },
  { name: 'name4', age: 10 },
  { name: 'name4', age: 27 }
]
Bài 2: Viết code chuyển mảng đã sắp xếp ở bài 1 thành mảng tên
VD: [‘name4’, ‘name2’, ‘name3’]
Bài 3: Tạo 1 mảng có 100 phần tử toàn bộ là số 0, chuyển mảng vừa tạo thành mảng mới có giá trị từ 0->99, lọc ra những số chia hết cho 5 rồi tính tổng những số còn lại
Bài 4: Cho mảng sau
[
  { name: 'name1', count: 13 },
  { name: 'name3', count: 23 },
  { name: 'name1', count: 25 },
  { name: 'name2', count: 27 },
  { name: 'name3', count: 30 },
  { name: 'name2', count: 20 }
]

Viết code nhóm các user có cùng name và cộng tổng số count thành một mảng mới
VD:
[
  { name: 'name1', count: 38 },
  { name: 'name3', count: 53 },
  { name: 'name2', count: 47 }
]
*/