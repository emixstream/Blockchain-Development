pragma solidity ^0.6.0;
//un contratto che contiene un valore privato, protetto, come un codice bancario
//applicando un multi contratto 

contract Ownable {
    address owner;
    
    constructor() public{
        owner = msg.sender;
    }
    // usare un comando "require" dentro un modifier permette sostanzialmente di evitare la riscrittura del codice ogni volta
    modifier onlyOwner(){
        require(msg.sender == owner, 'must be owner');
        _;
    }
}

//si può usare il concetto di "eredità", molto pythoniano per modificare la proprietà dello smart contract
// tutti i valori secret stanno in questo modulo di cui sarà creata una proxy, comunemente definita factory


contract SecretVault {
    string secret;
// come se due individui si passassero la stessa chiave per aprire la stessa porta
    constructor(string memory _secret) public {
        secret = _secret;
    }
    
    function getSecret() public view returns(string memory){
        return secret;
    }    
}

contract MyContract is Ownable {
    
    address secretVault;
    //notare l'uso di lettere minuscle e maiuscole per distinguere gli oggetti in base ai vari tipi
    constructor(string memory _secret) public {
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
        super;
        //super permettesostanzialmente la ereditarità
    }
    
    function getSecret() public view onlyOwner returns(string memory){
        SecretVault _secretVault = SecretVault(secretVault);
        return _secretVault.getSecret();
    }
}







