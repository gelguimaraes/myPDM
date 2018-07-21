//
//  FormViewController.swift
//  LigaJustica
//
//  Created by IFPB on 21/07/2018.
//  Copyright © 2018 IFPB. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet weak var tfNome: UITextField!
    @IBOutlet weak var tfURL: UITextField!
    @IBOutlet weak var stNota: UIStepper!
    @IBOutlet weak var lbNota: UILabel!
    @IBOutlet weak var swPoder: UISwitch!
    
    
    var index: Int!
    var cadastro: Cadastro!

    override func viewDidLoad() {
        super.viewDidLoad()
        let delegate = UIApplication.shared.delegate as! AppDelegate
        self.cadastro = delegate.cadastro
    }

   
    @IBAction func definirNota(_ sender: Any) {
        let nota = Int(self.stNota.value)
        self.lbNota.text = String(nota)
    }
    
  
    
    @IBAction func salvar(_ sender: Any) {
        let nome = self.tfNome.text!
        let nota = Int(self.stNota.value)
        let url = self.tfURL.text!
        let poder = self.swPoder.isOn
        let personagem = Personagem(nome: nome, nota: nota, poder: poder, url: url)
        
        if (self.index != nil){
            self.cadastro.update(index: self.index, personagem: personagem)
        }else{
            self.cadastro.add(personagem: personagem)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if (self.index != nil){
            let personagem = self.cadastro.get(index: self.index)
            self.tfNome.text = personagem.nome
            self.tfURL.text = personagem.url
            self.lbNota.text = String(personagem.nota)
            self.stNota.value = Double(personagem.nota)
            self.swPoder.isOn = personagem.poder
        }
        
        //self.tfNome.becomeFirstResponder()
    }
    
    
}
