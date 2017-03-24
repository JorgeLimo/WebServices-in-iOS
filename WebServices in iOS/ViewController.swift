//
//  ViewController.swift
//  WebServices in iOS
//
//  Created by Alumno on 23/03/17.
//  Copyright © 2017 Jorge Luis Limo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var publicaciones = Array<publicacion>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for i in 1...8{
            
            let publi =  publicacion()
            publi.titulo = "publicacion \(i)"
            publi.contenido = "contenido \(i)"
            publicaciones.append(publi)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return publicaciones.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! PublicacionCelda
        
        let indice = indexPath.row
        
        let publi = publicaciones[indice]
        
        cell.lbltitulo.text = publi.titulo
        cell.txtcontenido.text = publi.contenido
        
        return cell
    }

}

