const { assert } = require("console");

const CardList = artifacts.require("CardList"); 

contract("CardList" , () => { 
    it("CardList Testing" , async () => { 
       const cardList = await CardList.deployed() ;
       await cardList.createCard('First', 2000, 'alskdjfl;askjdf', 100, 20, 10);
       const {name, price, imageUrl, manaCost, damage, health} = await cardList.getCardById(0);
       assert(name == "First");
       assert(price == 2000);
       assert(imageUrl == 'alskdjfl;askjdf');
       assert(manaCost == 100);
       assert(damage == 20);
       assert(health == 10);
    }); 
});