pragma solidity ^0.4.25;

contract ContractWeb2{

    uint private myValue; 
    event LogSetMyValue(uint _myNewValue, address _sender);

// Constructor pagable: puedo enviar ethers cuando envío el contrato a la blockchain.

    constructor (uint _myValue) public payable { // 1
        myValue= _myValue;
        emit LogSetMyValue(myValue, msg.sender);
    }


    // sendEtherFromAddress: envía ether de una cuenta a otra.
    function sendEtherFromAddress(address payable _receiver) public {
        _receiver.transfer(msg.value);
    }

    // sendContractEther: me permite enviar ethers desde mi contrato a una cuenta
    // ¿Cómo sé cual es la cuenta? por msg.sender , esa es la cuenta que está "llamando" a mi función. 
    function sendContractEther(uint _amount) public payable{
        msg.sender.transfer(_amount);
    }   

    // getAddressBalance: me permite obtener el balance de una cuenta cualquiera. 
    function getAddressBalance(address _account) public view returns(uint){ // 4
        return _account.balance;
    }

    // getContractBalance: obtiene el saldo/balance de este contrato.
    function getContractBalance () public view returns (uint){
        return address(this).balance; // 2

    }

    // sendEtherToContract: le puedo enviar ethers al contrato. Recibe ethers de una cuenta cualquiera a mi contrato.
    function sendEtherToContract() public payable{ // 3

    }


    // -----------------------------------------------------------------------------

    // getMyValue: obtiene el valor de una variable, es decir, obtiene info.

    function getMyValue() public view returns (uint){ 
        return myValue; 
    }

    // setMyValue: me permite modificar el valor de esa variable o info. 

    function setMyValue(uint _myNewValue) public {

        myValue= _myNewValue;
        emit LogSetMyValue(myValue, msg.sender);

    }

}



/*

1) La palabra reservada "payable" me indica que el contrato puede recibir pagos al enviarlo a la blockchain.
2) "balance" es una palabra reservada. Ahora puedo ver cuántos ether tengo en mi cuenta.
3) Me permite enviar dinero(ether) al contrato. O sea, me envían dinero desde otra cuenta a este contrato.
4) Me permite consultar el saldo (balance) de cualquier cuenta, a partir de su dirección (address)


*/