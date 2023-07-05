// Function:
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Function {
    function getResult() public pure returns (uint product, uint sum) {
        uint a = 11; // local variable
        uint b = 20;
        product = a * b;
        sum = a + b;
    }
}

// Functions Modifiers:
contract Owner {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    modifier costs(uint256 price) {
        require(msg.value >= price, "Insufficient value sent");
        _;
    }
}

contract Register is Owner {
    mapping(address => bool) registeredAddresses;
    uint256 price;

    constructor(uint256 initialPrice) {
        price = initialPrice;
    }

    function register() public payable costs(price) {
        registeredAddresses[msg.sender] = true;
    }

    function changePrice(uint256 _price) public onlyOwner {
        price = _price;
    }
}


//View function:
contract ViewFunction {
    uint num1 = 2;
    uint num2 = 4;

    function getResult() public pure returns (uint product, uint sum) {
        uint localNum1 = 10;
        uint localNum2 = 16;
        product = localNum1 * localNum2;
        sum = localNum1 + localNum2;
    }
}

//Pure function:

contract PureFunction {
    function getResult() public pure returns (uint product, uint sum) {
        uint num1 = 2;
        uint num2 = 10;
        product = num1 * num2;
        sum = num1 + num2;
    }
}


//Fallback function:
contract Sink {
    fallback() external payable {}
}

contract Caller {
    function callTest(ViewFunction viewContract) public returns (bool) {
        (bool success, ) = address(viewContract).call(abi.encodeWithSignature("nonExistingFunction"));
        require(success);
        // viewContract.x is now 1
        address payable viewPayable = payable(address(viewContract));
        // Sending ether to ViewFunction contract,
        // the transfer will fail, i.e. this returns false here.
        return (viewPayable.send(2 ether));
    }

    function callSink(Sink sink) public returns (bool) {
        address payable sinkPayable = payable(address(sink));
        return (sinkPayable.send(2 ether));
    }
}

//Function Overloading:
contract FunctionOverloading {
    function getSum(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    function getSum(uint a, uint b, uint c) public pure returns (uint) {
        return a + b + c;
    }

    function callSumWithTwoArguments() public pure returns (uint) {
        return getSum(1, 2);
    }

    function callSumWithThreeArguments() public pure returns (uint) {
        return getSum(1, 2, 3);
    }
}

// Mathematical Function:
contract MathematicalFunction {
    function callAddMod() public pure returns (uint) {
        return addmod(14, 15, 13); // // addmod= (a+b)%c
    }

    function callMulMod() public pure returns (uint) {
        return mulmod(14, 15, 13);// // mulmod= (a*b)%
    }
}


// Cryptographic function:
contract CrytographicFunction{
    function callKeccak256() public pure returns(bytes32 result){
        return keccak256("ABC");
    }
}