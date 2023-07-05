//Inheritance:
pragma solidity ^0.5.0;

contract C {
    // private state variable
    uint private data;
    
    // public state variable
    uint public info;
    
    // constructor
    constructor() public {
        info = 20;
    }
    
    // private function
    function increment(uint a) private pure returns(uint) {
        return a + 1;
    }
    
    // public function
    function updateData(uint a) public {
        data = a;
    }
    
    function getData() public view returns(uint) {
        return data;
    }
    
    function compute(uint a, uint b) internal pure returns(uint) {
        return a + b;
    }
    
    function getComputedResult(uint a, uint b) public pure returns(uint) {
        return compute(a, b);
    }
}

// Derived Contract
contract E is C {
    uint private result;
    C private c;
    
    constructor() public {
        c = new C();
    }
    
    function getComputedResult() public {
        result = c.getComputedResult(3, 5);
    }
    
    function getResult() public view returns(uint) {
        return result;
    }
    
    function getData() public view returns(uint) {
        return c.info();
    }
}
