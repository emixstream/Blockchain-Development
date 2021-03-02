pragma solidity ^0.6.0;


//questa è la prova di come la blockchain sia sostanzialmente un database publico, lento... ma meno della PA XD


//mapping, è come una lista, vista al punto 2, ma è più potente perchè associa chiavi a valori, come un database vero e proprio
//un classico esempio è il catasto, un iniseme di chiavi valore, E ha 2 case, M ne ha 5, di cui una con E e Z ne ha 1
//chiave => valore 

contract MyContract {
    // se R non ha case, la blockchain restutisce vuoto
    //constructor opera una volta solo in fase di deploy
    mapping(uint => string) public names;
    //al posto che solo resituire informazioni questo ledger può anche permettere l'iscrizione delle informazioni al suo interno
    //ad esempio una biblioteca che acquista libri
    mapping(uint => Book) public books;
    //si può fare una operazione di nested mapping, cioè più "libri" di un solo autore univocamente riferito
    // in questo caso saranno riferiti ad un indirizzo ETH 
    mapping(address => mapping(uint => Book)) public myBooks;
    
    struct Book{
        string title;
        string author;
    }
    constructor() public {
        names[1] = "adam";
        names[2] = "karl";
        names[3] = "jo";
    }
    //si mette in numero, il titolo e l'autore
    function addBook(uint _id, string memory _title, string memory _author)  public {
        books[_id] = Book(_title, _author);
    }
    
    //msg è l'indirizzo di chi sta chiamando la fuznione sarà la prima chiava e _id è la chiave del libro associato
    function addMyBook(uint _id, string memory _title, string memory _author) public {
        myBooks[msg.sender][_id] = Book(_title, _author);
    }
}








