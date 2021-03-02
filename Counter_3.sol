//questa è la verisione intermedia
pragma solidity ^0.6.0;

    //nome dello smart contract "Counter"
contract Counter {
    // il valore count è quello che verrà salvato nella blockchain
    // ogni volta che leggiamo questa funzione stiamo aggiornando il valore nella blockchain
    uint public count = 1;     

    function incrementCount() public {
        count = count +1;
    }
}
