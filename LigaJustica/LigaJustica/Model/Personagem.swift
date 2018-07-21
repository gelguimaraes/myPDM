//
//  Personagem.swift
//  LigaJustica
//
//  Created by IFPB on 21/07/2018.
//  Copyright © 2018 IFPB. All rights reserved.
//

import Foundation

class Personagem: NSObject, NSCoding {
    var nome: String!
    var nota: Int!
    var poder: Bool!
    var url: String!
    
    override var description: String{
        return "\(self.nome)"
    }
    
   
    init(nome: String, nota: Int, poder: Bool, url: String) {
        self.nome = nome
        self.nota = nota
        self.poder = poder
        self.url = url
    }
    
  
    required init?(coder aDecoder: NSCoder) {
        self.nome = aDecoder.decodeObject(forKey: "nome") as! String
        self.nota = aDecoder.decodeObject(forKey: "nota") as! Int
        self.poder = aDecoder.decodeObject(forKey: "poder") as! Bool
        self.url = aDecoder.decodeObject(forKey: "url") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.nome, forKey: "nome")
        aCoder.encode(self.nota, forKey: "nota")
        aCoder.encode(self.poder, forKey: "poder")
        aCoder.encode(self.url, forKey: "url")
    }
}
