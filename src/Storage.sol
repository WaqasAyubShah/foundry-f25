// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage {
    //general declaration way will be
    //Type visibality name

    uint256 number;

    struct Person {
        uint256 fvrtNumber;
        string name;
    }

    //Dynamic arrays
    Person[] public listofPeoples;

    //Mapping
    mapping(string => uint256) public nametofvrtNumber;

    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public virtual {
        number = num;
    }

    /**
     * @dev Return value
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256) {
        return number;
    }

    //calldata, memory, storage
    function addPerson(uint256 _fvrtNumber, string memory _name) public {
        //_name = "hayat";
        listofPeoples.push(Person({fvrtNumber: _fvrtNumber, name: _name}));
        nametofvrtNumber[_name] = _fvrtNumber;
    }
    //calldata can't be change, but memory and storage can be change, while storage is used for long term storage
    //memory is used as temprary var.
}
