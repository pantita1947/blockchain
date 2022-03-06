// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;
contract ProofOfHotel {  
  
  mapping (bytes32 => bool) private listRoom;

  //---events---
  event Add( 
    address from,   
    string text,
    bytes32 hash,
    uint256 timestamp
  );

  // store the proof for a student in the contract state
  function recordProof(bytes32 proof) private {
    listRoom[proof] = true;
  }
  
  // record a student name
  function reserve(string memory room) public payable {
     
    recordProof(hashing(room));
    
    //---fire the event---
    emit Add(msg.sender, room, 
        hashing(room),block.timestamp);
    
  }
  
  // SHA256 for Integrity
  function hashing(string memory room) private 
  pure returns (bytes32) {
    return sha256(bytes(room));
  }
}