pragma solidity ^0.6.0;

contract MyContract {
  //array con numeri non negativi
  //ricorda che l'array parte da 0
  //re ricerco la posizione oltre la "2" ho un etherum virtual machine error!
  uint[] public uintArray = [1, 2, 3];
  string[] public stringArray = ["apple", "banana", "carrot"];
  string[] public values;
  // questo mi permette di torvare i valori da due liste, ad esempio un contratto multilaterale in cui gli obbligati sono vincolati tra loro in maniera incrociata
  uint[][] public array2D = [[1, 2, 3], [4, 5, 6]];
  
  //questa funzione aggiunge nomi ad una lista, ad esempio in un contratto potrebbero essere i chirografari, o gli obbligazionisti o azionisti...
  function addValue(string memory _value) public {
      values.push(_value);
      
  }
  function valueCount() public view returns (uint) {
      return values.length;
  }
  //mapping
}
