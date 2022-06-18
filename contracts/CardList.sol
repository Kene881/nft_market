pragma solidity >=0.4.22 <0.9.0;

contract CardList{
    uint public cardsCount;

    struct Card {
        string imageHash;
        string ipfsInfo;

        string name;
        uint price;
    }

    constructor() public {
        cardsCount = 0;
    }

    mapping(uint => Card) public cards;

    function createCard(string memory name, uint price, string memory imageHash, string memory ipfs) public {
        cards[cardsCount++] = Card(
            imageHash, 
            ipfs,
            name,
            price
        );
    }

    function getCardById(uint id) public view returns (string memory name, uint price, string memory imageHash, string memory ipfs)  {
        return (cards[id].name, cards[id].price, cards[id].imageHash, cards[id].ipfsInfo);
    }
}

// contract Card {
//     mapping(address => Image[]) private image;
//     string public name;
//     uint public price;

//     constructor() public {
//         name = "default";
//         price = 0;
//     }

//     struct Image {
//         string imageHash;
//         string ipfsInfo;
//     }
 
//     function uploadImage(string memory imageHash, string memory ipfs) public{
//        image[msg.sender].push(Image(imageHash, ipfs));
//     }

//     function setName(string memory nm) public {
//         name = nm;
//     }

//     function setPrice(uint pr) public {
//         price = pr;
//     }
// }