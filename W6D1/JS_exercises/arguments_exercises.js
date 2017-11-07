function sum (...args) {
  if (args.length === 0) {
    return undefined;
  }
  let res = 0;
  const argsArray = Array.from(args);
  argsArray.forEach ((el) => {
    res += el;
  });

  return  res;
}



// console.log(sum(1, 2, 3, 4) === 10);


Function.prototype.myBind = function (context, ...args) {
  return (...innerArgs) => {
    return this.apply(context, args.concat(innerArgs));
  };
};

//
// class Cat {
//   constructor(name) {
//     this.name = name;
//   }
//
//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }
//
// const markov = new Cat("Markov");
// const breakfast = new Cat("Breakfast");
//
// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true
//
// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(breakfast, "meow", "Kush")();
// // Breakfast says meow to Kush!
// // true
//
// // no bind time args (other than context), call time args are "meow" and "me"
// markov.says.myBind(breakfast)("meow", "a tree");
// // Breakfast says meow to a tree!
// // true
//
// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(breakfast, "meow")("Markov");
// // Breakfast says meow to Markov!
// // true
//
// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");
// // Breakfast says meow to me!
// // true

function curriedSum(numArgs) {
  const numbers = [];
  let _curriedSum = (num) => {
    numbers.push(num);
    // console.log(numbers);
    if (numbers.length === numArgs) {
      return sum(...numbers);
    } else {
      return _curriedSum;
    }
  };
  return _curriedSum;
}

// console.log(curriedSum(5)(1)(3));
// console.log('should be 4');

Function.prototype.curry = function(substitutionCount) {
  // let functionsArray = [];
  // for (let i = 0; i < substitutionCount; i++) {
  //   functionsArray.push(null);
  // }
  const args = [];
  let curryFunction = (arg) => {
    args.push(arg);
    if (args.length === substitutionCount) {
      return this(...args);
    } else {
      return curryFunction;
    }
  };
  return curryFunction;
};

console.log(sum.curry(3)(1)(2)(3));
