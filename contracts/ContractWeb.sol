pragma solidity ^0.4.25;

contract ContractWeb{

    uint private myValue; // al ser privada NO puede ser consultada fuera del contrato. 


    event LogSetMyValue(uint _myNewValue, address _sender);

    constructor (uint _myValue) public {
        
        myValue= _myValue;
    }

    // Esta función va a devolver un tipo de dato uint, llamada "myValue". 
    // es view porque va a poder ser visto desde la blockchain pero SIN modificar los datos en ella.

    // Get lee los valores en la blockchain

    function getMyValue() public view returns (uint){ // regresa un valor de tipo uint
        return myValue; // ¿Qué es lo que regresa? Mi variable myValue
    }

    // Set escribe valores en la blockchain. No puede ser view porque al reescribir mi variable
    // sí se van a guardar valores en la blockchain y por tanto ésta se modificará.
    // Al NO ser view, SÍ tendrá un costo monetario. 

    function setMyValue(uint _myNewValue) public {

        myValue= _myNewValue;
        emit LogSetMyValue(myValue, msg.sender);

    }

}






/*

Estructura a grandes rasgos de un contrato:

//   Importar otros contratos, interfaces o librerías
contract Nuevocontrato{
    // Librerías
    // Variables
    // Eventos
    // Modificadores (sirven para proteger los contratos)
    // Constructor
    // Funcioens
}

El constructructor es una función que se ejecuta una sola vez.

"Deploy" es algo así como "enviar" o "colocar" en español. 


*/

// FUENTE:
// https://www.youtube.com/c/GimerCervera/videos