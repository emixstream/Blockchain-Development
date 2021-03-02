//questa è la prima verisione intermedia
pragma solidity ^0.6.0;

    //nome dello smart contract "Counter"
contract Counter {
    // il valore count è quello che verrà salvato nella blockchain
    // ogni volta che leggiamo questa funzione stiamo aggiornando il valore nella blockchain
    uint count = 0;     

    //unsigned int- non può essere negativo
    //public- così è accessibile anche da esterno
    //view- l'output può essere visto anche all'esterno
    //notare returns con la s finale 
    function getCount() public view returns(uint){
        return count;
        
    }

    function incrementCount() public {
        count = count +1;
    }
}

