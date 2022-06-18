const { assert } = require("console");

const CardList = artifacts.require("CardList"); 

contract("CardList" , () => { 
    it("CardList Testing" , async () => { 
       const cardList = await CardList.deployed() ;
       await cardList.createCard('First', 2000, 'alskdjfl;askjdf', 'alsdkjfl;askjdf');
       const {name, price, imageHash, ipfsInfo} = await cardList.getCardById(0);
       assert(name == "First");
       assert(price == 2000);
       assert(imageHash == 'alskdjfl;askjdf');
       assert(ipfsInfo == 'alsdkjfl;askjdf');
    }); 
});