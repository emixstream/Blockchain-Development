pragma solidity ^0.6.0;


//con questo smart contract l'utente sarà in grado di pagare la camera d'albergo
//questa si aprirà in conseguenza al pagamento

contract HotelRoom {
    //questo è l'indirizzo del proprietario
    //il proprietario in questo esempio è chi fa il deply dello smart contract
    // lo Status della camera
    enum Statuses { Vacant, Occupied }
    Statuses currentStatus;
    
    event Occupy(address _occupant, uint _value);
    
    
    address payable public owner;
    
    constructor() public {
        //il messaggio è in realtà il richiamo della funzione
        owner = msg.sender;
        currentStatus = Statuses.Vacant;
    }
    
    modifier onlyWhileVacant {
        require(currentStatus == Statuses.Vacant, "Currently Occupied.");
        _;
    }
    
    
    modifier costs (uint _amount){
        require(msg.value >= _amount, "Not enough Ether provided.");
        //va controllato anche il pagamento
        _;
    }
    
    // questa funzione manda il pagamento al proprietario della camera
    //controllando se la camera è effettivamente libera
    //questa funzione per il pagamento è molto particolare, di fatto non compare come "click buttom" in fase di deploy
    
    
    
    receive() external payable onlyWhileVacant costs(2 ether) {
        //sostanzialmente se è occupato il pagamento viene respinto e viene restituito un messaggio di errore
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value);
        emit Occupy(msg.sender, msg.value);
    }
}










