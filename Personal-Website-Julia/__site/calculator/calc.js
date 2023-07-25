const history = document.querySelector(".history");
const current = document.querySelector(".current");

const numbers = document.querySelectorAll(".numbers *");
const operators = document.querySelectorAll(".operations *");
const utilities = document.querySelectorAll(".utilities *");

let resultSwitch = false;
for (i of [...numbers, ...operators, ...utilities]) {
  i.style.touchAction = "none";
  i.style.transition = "1s";

  i.addEventListener("pointerdown", (e) => {
    e.target.classList.add("buttonPressed");
  });
  i.addEventListener("pointerup", (e) => {
    e.target.classList.remove("buttonPressed");
  });
  i.addEventListener("pointerleave", (e) => {
    e.target.classList.remove("buttonPressed");
  });

  switch (true) {
    case i.innerHTML == "=":
      i.addEventListener("pointerdown", (e) => {
        history.innerHTML = calculate(current.innerHTML);
        resultSwitch = true;
      });
      break;
    case i.innerHTML == "clear":
      i.addEventListener("pointerdown", (e) => {
        current.innerHTML = "";
        history.innerHTML = "";
      });
      break;
    case i.innerHTML == "back":
      i.addEventListener("pointerdown", (e) => {
        current.innerHTML = current.innerHTML.slice(0, -1);
      });
      break;
    default:
      i.addEventListener("pointerdown", (e) => {
        if (resultSwitch == true) {
          resultSwitch = false;
          current.innerHTML = "";
          history.innerHTML = "";
        }
        current.innerHTML += `${e.target.innerHTML}`;
      });
  }
}

function tokenize(str) {
  words = [];
  stack = "";
  for (const [ind, i] of str.split("").entries()) {
    //Exceptions
    if (
      i == "-" &&
      !"+-*/".includes(str[ind + 1]) &&
      "+-*/".includes(str[ind - 1])
    ) {
      stack += i;
      continue;
    }
    if ("+-*/".includes(i) && "+-*/".includes(str[ind - 1]))
      throw "ERROR: Repeat operation";
    if ("+*/".includes(str[0]) || "+-*/".includes(str.slice(-1)))
      throw "ERROR: Invalid operation";
    if (i == "-" && ind == 0) {
      stack += i;
      continue;
    }

    if ("+-*/".includes(i)) {
      if (stack != "") {
        words.push(stack);
        stack = "";
      }
      words.push(i);
    } else {
      stack += i;
    }
  }
  words.push(stack);
  words.push("$");

  return words;
}

function reducer(stk) {
  while (stk.length >= 3) {
    let [a, op, b] = stk.splice(-3).reverse();
    a = +a;
    b = +b;

    const result = (() => {
      switch (op) {
        case "*":
          return b * a;
        case "/":
          return b / a;
        case "+":
          return b + a;
        case "-":
          return b - a;
      }
    })();
    stk.push(+result);
  }
}

function formatResult(str) {
  if (Number.isInteger(+str)) {
    return str;
  }
  return parseFloat(+str.toFixed(6));
}

function calculate(str) {
  let tkn;
  try {
    tkn = tokenize(str);
  } catch (error) {
    return error;
  }

  let stk = [];
  for (let i = 0; i <= tkn.length; i++) {
    if (tkn[i] == "$") {
      break;
    }
    let lookahead = tkn[i + 1];
    stk.push(tkn[i]);
    if (!["*", "/"].includes(lookahead) && !["*", "/"].includes(tkn[i])) {
      reducer(stk);
    }
  }
  let result = stk[0];
  return formatResult(result);
}
