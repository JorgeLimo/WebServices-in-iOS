//
//  ViewController.swift
//  WebServices in iOS
//
//  Created by Alumno on 23/03/17.
//  Copyright © 2017 Jorge Luis Limo. All rights reserved.
//

import UIKit
import MBProgressHUD

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tvpublicaciones: UITableView!
    
    
    var publicaciones = Array<publicacion>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return publicaciones.count
    }
    
    func obtenerPublicaciones(){
        
        publicaciones.removeAll()
        let hub  = MBProgressHUD(view : self.view)
        hub.show(animated: true)
        hub.label.text = "Cargando..."
        
        
        self.view.addSubview(hub)
        
        PublicacionWebService.listarTodo { (jsonResultado) in
            self.publicaciones = jsonResultado
            self.tvpublicaciones.reloadData()
            hub.hide(animated: true)

        }
        
        /**for i in 1...8{
            
            let publi =  publicacion()
            publi.titulo = "publicacion \(i)"
            publi.contenido = "contenido \(i)"
            publicaciones.append(publi)
        }
        **/
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let publi = publicaciones[indexPath.row]
        
        self.performSegue(withIdentifier: "detalle", sender: publi)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if  segue.identifier == "detalle"{
            
            let detallecontroler = segue.destination as! DetalleViewController
            
            detallecontroler.publi = sender as! publicacion
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! PublicacionCelda
        
        let indice = indexPath.row
        
        let publi = publicaciones[indice]
        
        cell.lbltitulo.text = publi.titulo
        cell.txtcontenido.text = publi.contenido
        
        return cell
    }
    
    @IBAction func cargarpublicaciones(_ sender: UIBarButtonItem) {
        self.obtenerPublicaciones()
    }
    
    

}

