pragma solidity >=0.4.22 <0.9.0;

contract Card {
    mapping(address => Image[]) private image;
    string public name;
    uint public price;

    struct Image {
        string imageHash;
        string ipfsInfo;
    }

    function uploadImage(string memory imageHash, string memory ipfs) public{
       image[msg.sender].push(Image(imageHash, ipfs));
    }

    function setName(string memory nm) public {
        name = nm;
    }

    function setPrice(uint pr) public {
        price = pr;
    }
}