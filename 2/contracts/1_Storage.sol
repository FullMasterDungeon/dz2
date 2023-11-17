// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Storage {
    // Структура произвольного содержания
    struct MyStruct {
        uint256 intValue;
        string stringValue;
        address addressValue;
        bool boolValue;
    }

    // Отображение ключа на значение (ваша структура)
    mapping(bytes32 => MyStruct) public myStructMapping;

    // Событие для логгирования добавления структуры
    event StructAdded(bytes32 key, uint256 intValue, string stringValue, address indexed addressValue, bool boolValue);

    // Событие для логгирования удаления структуры
    event StructRemoved(bytes32 key);

    // Функция добавления структуры в отображение
    function addStruct(bytes32 key, uint256 intValue, string memory stringValue, address addressValue, bool boolValue) external {
        MyStruct memory newStruct = MyStruct(intValue, stringValue, addressValue, boolValue);
        myStructMapping[key] = newStruct;
        emit StructAdded(key, intValue, stringValue, addressValue, boolValue);
    }

    // Функция удаления структуры из отображения
    function removeStruct(bytes32 key) external {
        delete myStructMapping[key];
        emit StructRemoved(key);
    }
}
