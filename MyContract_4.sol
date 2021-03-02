pragma solidity ^0.6.0;



//le classiche operazioni condizionali in solidity
//trovare ad esempio chi può esercitare diritti in base a una condizione
// in questo esempio volutamente banale si valuta se un numero è o no pari

// lo script ricorda molto un costrutto C++

contract MyContract {
    
    
// questa funzione è invece palesemente proveniente da java script 
    
    uint[] public numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10,12, 14];
    
    //posso registrare il possesso di questo smart contract con questa funzione, ad esempio in un contesto di brevetti ciò può risultare molto utile
    //in tal modo è palese a tutti chi ha registrato il tal valore/brevetto...
    address public owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
//questa funzione permette di vedere quanto persone hanno un certo numero di case, capitale, prodotti
    function countEvenNumbers () public view returns(uint) {
        uint count = 0;
        
        for(uint i = 0; i < numbers.length; i++) {
            if(isEvenNumber(numbers[i])) {
                count ++;
            }
        }
        return count;
    }
    
    //questa funzione darà un warning ignorabile
    //è la versione booleana estesa che viene contratta nella funzione successiva
    function isEvenNumber(uint _number) public view returns(bool) {
        if(_number % 2 == 0) {
            return true;
        } else {
            return false;
        }
        
    }
    //versione contratta
    function isOwner() public view returns(bool) {
        return(msg.sender == owner);

    }
    
}