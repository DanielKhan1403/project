var glasn = ['a', 'e', 'i', 'o', 'u', 'y'];
var words = ['banana', 'apple', 'pumkin', 'potato'];

function replacer() {
    for (let gde = 0; gde < words.length; gde++) {
        let currentWord = words[gde];
        for (let chto = 0; chto < glasn.length; chto++) {
            let currentVowel = glasn[chto];
            currentWord = currentWord.replace(currentVowel, '*');
        }
        console.log(currentWord);
    }
}

replacer();



const stat = {
    'John':9.4,
    'Mark':5.5,
    'Luis':5.8,
    'Bob':6.0,
    'Markus':7.3
}

topgrade = 6.0


function getStudents(grade,topgrade){
    let students = []
    for(let student in grade){
        if(grade[student]>=topgrade){
            students.push(student,grade[student])

        }
    }
    return students
}

let students = getStudents(stat,topgrade)
console.log(students)



let arr_dubl = [1,2,2,2,2,2,2,2]
function remove(arr){
    return [...new Set(arr)]
};


console.log(remove(arr_dubl))


function getWords(str){
    let words1 = str.split(/\s+/)
    let result = []

    for (let word of words1){
        if(word[0]===word[0].toUpperCase()){
            result.push(word)
        }
    }
    return result
}

let stringi = 'Hello Hello Babaduk how Bebebebeb'

console.log(getWords(stringi))



function getStringLengths(strings) {
    let lengthsMap = {};

    for (let str of strings) {
        lengthsMap[str] = str.length;
    }

    return lengthsMap;
}

let stringArray =['banana', 'apple', 'pumkin', 'potato'];
let lengths = getStringLengths(stringArray);
console.log(lengths);  


function union(setA, setB) {
    return new Set([...setA, ...setB]);
}


let set1 = new Set([1, 2, 3]);
let set2 = new Set([3, 4, 5]);
let unionSet = union(set1, set2);
console.log(unionSet);  


function isValidNumber(str) {

    if (/^\d+$/.test(str)) {
       
        let num = parseInt(str, 10);
       
        if (num >= 10 && num <= 120) {
            return true;
        }
    }
    return false;
}


let inputString1 = "42";
let inputString2 = "150";
let inputString3 = "abc";

console.log(isValidNumber(inputString1));
console.log(isValidNumber(inputString2)); 
console.log(isValidNumber(inputString3));