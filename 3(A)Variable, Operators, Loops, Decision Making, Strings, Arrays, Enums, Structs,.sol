pragma solidity ^0.8.18;
//variable
contract Variable {
    uint storedData; // State variable
    
    constructor() {
        storedData = 40;
    }
    
    function getResult() public view returns(uint) {
        uint a = 1; // Local variable
        uint b = 5;
        uint result = a + b;
        require(result > 10, "Result must be greater than 10");
        return storedData; // Access the state variable
    }
}

//Operators :

//Arthmetic Operator:
// SPDX-License-Identifier: MIT

contract ArithmeticOperators {
    uint16 public a = 50;
    uint16 public b = 20;

    uint public sum = a + b;
    uint public diff = a - b;
    uint public mul = a * b;

    uint public div = a / b;
    uint public mod = a % b;
    uint public dec = --b;
    uint public inc = ++a;
}

// Relational Operator:


pragma solidity ^0.8.18;

contract RelationalOperator {
    uint16 public a = 70;
    uint16 public b = 10;
    bool public eq = a == b;
    bool public noteq = a != b;
    bool public gtr = a > b;
    bool public les = a < b;
    bool public gtreq = a >= b;
    bool public leseq = a <= b;
}

//Logical Operator:
pragma solidity ^0.8.18;
contract LogicalOperator {
    function Logic(bool a, bool b) public pure returns (bool, bool, bool) {
        // Logical AND operator
        bool andResult = a && b;
        // Logical OR operator
        bool orResult = a || b;
        // Logical NOT operator
        bool notResult = !a;
        return (andResult, orResult, notResult);
    }
}
//Bitwise Operator:
contract BitwiseOperator {
    // Declaring variables
    uint16 public a = 20;
    uint16 public b = 50;
    uint16 public bitwiseAnd = a & b;
    uint16 public bitwiseOr = a | b;
    uint16 public bitwiseXor = a ^ b;
    uint16 public leftShift = a << b;
    uint16 public rightShift = a >> b;
    uint16 public bitwiseNot = ~a;
}

//Assignment Operator:
contract AssignmentOperator {
    // Declaring variables
    uint16 public assignment = 20;
    uint16 public assignmentAdd = 50;
    uint public assignSub = 50;
    uint public assignMul = 10;
    uint public assignDiv = 50;
    uint public assignMod = 32;
    
    function getResult() public {
        assignmentAdd += 10;
        assignSub -= 20;
        assignMul *= 10;
        assignDiv /= 10;
        assignMod %= 20;
    }
}

//loops:
// whileLoop:

contract WhileLoop {
    // Declaring a dynamic array
    uint[] data;
    // Declaring state variable
    uint8 j = 0;
    
    function loop() public returns (uint[] memory) {
        while (j < 16) {
            j++;
            data.push(j);
        }
        return data;
    }
}

// Dowhile loop:
contract DoWhileLoop {
    // Declaring a dynamic array
    uint[] data;
    // Declaring state variable
    uint8 j = 0;

    // Defining function to demonstrate 'do-while loop'
    function loop() public returns (uint[] memory) {
        do {
            j++;
            data.push(j);
        } while (j < 8);
        return data;
    }
}

// Forloop:
contract ForLoop {
    // Declaring a dynamic array
    uint[] data;
    
    // Declaring a function to demonstrate 'For loop'
    function loop() public returns (uint[] memory) {
        for (uint i = 0; i < 4; i++) {
            data.push(i);
        }
        return data;
    }
}


//Decision making

//If statement:

contract IfStatement {
    // Declaring state variable
    uint i = 20;
    
    function decision_making() public view returns (bool) {
        if (i < 20) {
            return true;
        }
        
        return false;
    }
}
//If…else statement:

contract IfElseStatement {
    // Declaring state variables
    uint i = 20;
    bool even;
    
    // Defining function to demonstrate the use case of 'if...else statement'
    function decision_making() public payable returns (bool) {
        if (i % 2 == 0) {
            even = true;
        } else {
            even = false;
        }
        
        return even;
    }
}
//If…else if…else statement:
contract IfElseIfStatement {
    // Declaring state variables
    uint i = 12;
    string result;
    
    function decision_making() public returns (string memory) {
        if (i < 10) {
            result = "less than 10";
        } else if (i == 10) {
            result = "equal to 10";
        } else {
            result = "greater than 10";
        }
        
        return result;
    }
}

//String:
//Creating a contract
contract StringArray {
    string[] public row;

    function getRow() public view returns (string[] memory) {
        return row;
    }

    function pushToRow(string memory newValue) public {
        row.push(newValue);
    }
}

//Array:
contract Test {
    function testArray() public pure {
        uint len = 7;
        uint[] memory a = new uint[](7);
        // bytes is same as byte[]
        bytes memory b = new bytes(len);
        assert(a.length == 7);
        assert(b.length == len);
        // access array variable
        a[6] = 8;
        // test array variable
        assert(a[6] == 8);
        // static array
        uint[3] memory c = [uint(1), 2, 3];
        assert(c.length == 3);
    }
}

//Enums:

contract Enums {
    enum FreshJuiceSize { SMALL, MEDIUM, LARGE }
    FreshJuiceSize public choice;
    FreshJuiceSize constant defaultChoice = FreshJuiceSize.MEDIUM;

    function setLarge() public {
        choice = FreshJuiceSize.LARGE;
    }

    function getChoice() public view returns (FreshJuiceSize) {
        return choice;
    }

    function getDefaultChoice() public pure returns (uint) {
        return uint(defaultChoice);
    }
}

//Struct:
contract Struct {
    struct Book {
        string title;
        string author;
        uint book_id;
    }

    Book public book;

    function setBook() public {
        book = Book('Learn Javascript', 'TP', 4);
    }

    function getBookId() public view returns (uint) {
        return book.book_id;
    }
}

//Mapping:
contract Mapping {
    struct Student {
        string name;
        string subject;
        uint8 marks;
    }

    // Creating mapping
    mapping(address => Student) public result;
    address[] public student_result;

    // Function adding values to the mapping
    function adding_values() public {
        address studentAddress = address(0xDEE7796E89C36BAdd1375076f39D69FafE252);
        Student storage student = result[studentAddress];
        student.name = "John";
        student.subject = "Chemistry";
        student.marks = 88;
        student_result.push(studentAddress);
    }
}
//conversion weitoether
contract Conversion {
    function weiToEther(uint weiAmount) public pure returns (uint) {
        return weiAmount / 1 ether;
    }
    
    function etherToWei(uint etherAmount) public pure returns (uint) {
        return etherAmount * 1 ether;
    }
}
//etherunit shows different ether units available in Solidity
contract EtherUnit {
    function getEtherUnits() public pure returns (uint, uint, uint, uint, uint) {
        uint weiValue = 1;
        uint gweiValue = 1 * 1e9;
        uint szaboValue = 1 * 1e12;
        uint finneyValue = 1 * 1e15;
        uint etherValue = 1 * 1e18;
        return (weiValue, gweiValue, szaboValue, finneyValue, etherValue);
    }
}

//Special Variable:

contract SpecialVariable {
    // Creating a mapping
    mapping(address => uint) rollNo;

    function setRollNo(uint _myNumber) public {
        rollNo[msg.sender] = _myNumber;
    }

    // Defining a function to return the roll number
    function whatIsMyRollNumber() public view returns (uint) {
        return rollNo[msg.sender];
    }
}