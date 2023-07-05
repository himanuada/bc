// LIBRARIES:
pragma solidity ^0.5.0;

library Search {
    function indexOf(uint[] storage self, uint value) public view returns (uint) {
        for (uint i = 0; i < self.length; i++) {
            if (self[i] == value) {
                return i;
            }
        }
        return uint(-1);
    }
}

contract Library {
    uint[] data;

    constructor() public {
        data.push(1);
        data.push(2);
        data.push(3);
        data.push(4);
        data.push(5);
    }

    function isValuePresent() external view returns (uint) {
        uint value = 4;
        // Search if value is present in the array using Library function
        uint index = Search.indexOf(data, value);
        return index;
    }
}


// ASSEMBLY:
contract Assembly {
    function add(uint a) public view returns (uint) {
        uint result;

        assembly {
            let c := add(a, 16)
            mstore(0x80, c)
            {
                let d := add(sload(c), 12)
                // assign the value of 'd' to 'result'
                result := d
                // 'd' is deallocated now
            }
            result := add(result, c)
        }

        return result;
    }
}



// EVENTS:
// Creating a contract
contract Events {
    // Declaring state variables
    uint256 public value = 0;

    // Declaring an event
    event Increment(address owner);

    // Defining a function for logging event
    function getValue(uint _a, uint _b) public {
        emit Increment(msg.sender);
        value = _a + _b;
    }
}


// ERROR HANDLING:
pragma solidity ^0.5.0;

contract ErrorHandling {
    function checkInput(uint _input) public pure returns (string memory) {
    require(_input > 0, "invalid uint8");
    require(_input <= 255, "invalid uint8");
    return "Input is Uint8";
}

    
    function Odd(uint _input) public pure returns (bool) {
    require(_input % 2 != 0);
    return true;
}

}
