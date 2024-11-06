// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData{
    struct student{
        uint256 ID ; 
        string name ; 
        uint256 age ; 
    }

    student [] public studentList ; 

    event studentAdded(string name , uint256 ID);
    event FallbackCalled(address sender , uint256 amount , string message); 

    function addStudent(string memory name_ , uint256  age_ , uint256  ID_) public{
        student memory newstudent = student({
            name : name_ ,
            ID : ID_ , 
            age : age_ 
        });

        studentList.push(newstudent);
        emit studentAdded(name_, ID_);
    }

    function getTotalStudents() public view returns (uint256){
        return studentList.length ; 
    }

    function getStudent(uint256 index) public view returns (string memory , uint256 , uint256){
        require(index < studentList.length , "not valid " );
        student memory stud = studentList[index]; 
        return (stud.name, stud.age,stud.ID ) ; 
    }

    fallback() external payable {
        emit FallbackCalled(msg.sender, msg.value, "thanks for using ether ");
    }
    receive() external payable { }
    function getContractBalance() public view returns (uint256){
        return address(this).balance ;
    }
}
