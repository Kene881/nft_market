const Card = artifacts.require("Card"); 

contract("Card" , () => { 
    it("Card Testing" , async () => { 
       const card = await Card.deployed() ; 
       await card.setName("User Name") ; 
       const result = await card.name() ; 
       assert(result === "User Name") ;
    }); 
});