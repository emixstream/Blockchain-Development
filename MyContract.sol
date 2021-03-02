pragma solidity ^0.6.0;

contract MyContract {
    //state variables, stanno sulla blockchain
    int public myInt = 1;
    //nel dettaglio, gli uint non possono avere segno, quindi "non possono negativizzarsi"
    uint public myUnit = 1;
    // ancora più selettività viene data dall'allocazione di memoria, per numeri grandi che portano però lentezza si assegnano uint256
    uint256 public myUint256 = 1;
    // per numeri meno grandi che portano però minore lentezza si assegnano uint8
    uint8 public myUnit8 = 1;
    //local variables, stanno solo nella funzione, proprio come con una funzione qualsiasi di python, javascript o C++
    
    //le stringhe finzionano allo stesso modo
    string public myString = "Hello Ether!!";
    //bytes32 è molto più performante di una stringhe, rendendo meno lenta la blockchain
    bytes32 public myBytes32 ="Hello Ether!!";
    
    //gli indirizzi sono il cuore della blockchain, gli utenti
    //questo non è il mio indirizzo pubblico quindi non mandare ETH!!   XD
    address public myAddress = 0x1CAFC063Ce8FdF5634E42b653383238aFD8cB8a1;
    
    //più avanzato è il modulo di struct che permette un effettivo utilizzo di dati, per un prodotto, una persona fisica o giuridica un voto, un'obbligazione ecc..
    struct MyStruct{
        uint myInt;
        string myString;
    }
    
    // ora si procede con l'operazione di fetching
    MyStruct public myStruct = MyStruct(1, "Hello Ether!!");
    
    
    function getValue() public pure returns(uint){
        uint value = 1;
        return value; 
    }
    
}

