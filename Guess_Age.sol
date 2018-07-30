pragma solidity ^0.4.20;

contract Guess_Age {
    
    uint256 my_age;
    address contract_creator;
    
    constructor(uint set_age) public payable{
        
        my_age = set_age;
        contract_creator = msg.sender;
        
    }
    
    function Guess_My_Age(uint256 age_guess) public{

        if (age_guess == my_age && contract_creator != msg.sender){
        
            msg.sender.transfer(address(this).balance);

        }
    }
    
    function Return_Balance_In_Contract() public view returns(uint256){

        return address(this).balance;
    
    }
    
    function Destroy_This_Contract() public{

        if (msg.sender == contract_creator){

            selfdestruct(contract_creator);
        
        }
    }
    
}