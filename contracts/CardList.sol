pragma solidity >=0.4.22 <0.9.0;

contract CardList{
    uint public cardsCount;

    struct Card {
        string imageUrl;
        string title;
        uint manaCost;
        uint damage;
        uint health;
        uint price;
    }

    constructor() public {
        cardsCount = 0;
    }

    mapping(uint => Card) public cards;

    function createCard(string memory title, uint price, string memory imageUrl, uint manaCost, uint damage, uint health) public {
        cards[cardsCount++] = Card(
            imageUrl,
            title,
            manaCost,
            damage,
            health,
            price
        );
    }

    function getCardById(uint id) public view returns (string memory title, uint price, string memory imageUrl, uint manaCost, uint damage, uint health)  {
        return (cards[id].title, cards[id].price, cards[id].imageUrl, cards[id].manaCost, cards[id].damage, cards[id].health);
    }
}