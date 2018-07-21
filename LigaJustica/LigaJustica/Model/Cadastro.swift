//
//  Cadastro.swift
//  LigaJustica
//
//  Created by IFPB on 21/07/2018.
//  Copyright © 2018 IFPB. All rights reserved.
//

import UIKit

class Cadastro: NSObject, NSCoding {
    var lista: Array<Personagem>!
    
    
    override init() {
        self.lista = Array<Personagem>()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        self.lista = aDecoder.decodeObject(forKey: "lista") as! Array<Personagem>
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.lista, forKey: "lista")
    }
    
    func add(personagem: Personagem) {
        self.lista.append(personagem)
    }
    
    func count() -> Int {
        return self.lista.count
    }
    
    func get(index: Int) -> Personagem {
        return self.lista[index]
    }
    
    func del(index: Int) {
        self.lista.remove(at: index)
    }
    
    func swap(origem: Int, destino: Int) {
        let tmp = self.lista[origem]
        self.lista[origem] = self.lista[destino]
        self.lista[destino] = tmp
    }
    
    func update(index: Int, personagem: Personagem) {
        self.lista[index] = personagem
    }
}

