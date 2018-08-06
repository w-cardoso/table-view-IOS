//
//  ViewController.swift
//  Exemplo1_TableView
//
//  Created by Usuário Convidado on 06/08/2018.
//  Copyright © 2018 guieiras. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var table: UITableView!
    let animal = ["Urso", "Girafa", "Rinoceronte", "Leão", "Elefante"]
    let fotos = ["urso", "girafa", "rino", "leao", "ele"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        celula.textLabel?.text = animal[indexPath.row]
        celula.imageView?.image = UIImage(named: "\(fotos[indexPath.row]).png")
        return celula
    }
    
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIImageView(image: UIImage(named: "cabecalho"))
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIImageView(image: UIImage(named: "rodape"))
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let msg = "Você escolheu \(animal[indexPath.row])"
        let alerta = UIAlertController(title: "Animal Selecionado", message: msg, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK!", style: .default, handler: { (action) in
            tableView.deselectRow(at: indexPath, animated: true)
        }))
        
        present(alerta, animated: true, completion: nil)
    }
}

