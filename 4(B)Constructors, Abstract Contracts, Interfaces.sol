// Constructors :
pragma solidity ^0.5.0;

// Creating a contract
contract constructorExample {
    // Declaring state variable.
    string str;
    
    // Creating a constructor to set the value of 'str'
    constructor() public {
        str = "This is an example of a constructor";
    }
    
    function getValue() public view returns (string memory) {
        return str;
    }
}

// AbstractContracts:
pragma solidity ^0.5.0;

contract abstractConstructor {
    function getResult() public view returns (uint);
}

contract Test is abstractConstructor {
    function getResult() public view returns (uint) {
        uint a = 10;
        uint b = 17;
        uint result = a + b;
        return result;
    }
}


// Interfaces:
pragma solidity ^0.5.0;

contract Interface {
    function getResult() public view returns (uint);
}

contract TestImplementation is Interface {
    function getResult() public view returns (uint) {
        uint a = 11;
        uint b = 67;
        uint result = a + b;
        return result;
    }
}
