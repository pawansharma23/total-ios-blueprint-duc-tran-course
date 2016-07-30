//: Playground - noun: a place where people can play

import UIKit

func fibonnaci(num: Int) -> Int {
    if num < 2 {
        return num
    } else {
        print(fibonnaci(num - 1) + fibonnaci(num - 2))
        return fibonnaci(num - 1) + fibonnaci(num - 2)
    }
}

fibonnaci(5)

func getPokemon() -> (id: Int, name: String, type: String) {
    let id = 1;
    let name = "Pikachu"
    let type = "Electrico"
    
    return (id, name, type)
}

let myPoke = getPokemon()
print("Datos - ID: \(myPoke.id), Nombre: \(myPoke.name), Tipo: \(myPoke.type)")

