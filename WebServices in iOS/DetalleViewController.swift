//
//  DetalleViewController.swift
//  WebServices in iOS
//
//  Created by Alumno on 23/03/17.
//  Copyright © 2017 Jorge Luis Limo. All rights reserved.
//

import UIKit

class DetalleViewController: UIViewController {

    var publi:publicacion!
    
    @IBOutlet weak var textdetalledetalle: UITextView!
    
    @IBOutlet weak var lbltitulodetalle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbltitulodetalle.text = publi.titulo
        textdetalledetalle.text = publi.contenido
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
