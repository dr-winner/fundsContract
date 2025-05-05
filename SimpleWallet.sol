// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleWallet {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Function to deposit funds into the contract
    receive() external payable {}

    // Function to send funds from the contract to another address
    function sendFunds(address payable _to, uint256 _amount) public {
        require(msg.sender == owner, "Only the owner can send funds");
        require(address(this).balance >= _amount, "Insufficient balance");

        _to.transfer(_amount);
    }

    // Function to check contract balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
