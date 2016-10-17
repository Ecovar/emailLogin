//
//  ViewController.swift
//  WebGiris
//
//  Created by Vural Ozsen on 26.09.2016.
//  Copyright © 2016 Vural Ozsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

  @IBOutlet weak var epostaField: UITextField!
    @IBOutlet weak var sifreField: UITextField!
    @IBAction func postaKayit(_ sender: AnyObject) {
        kayit.kaydet(viewController: self)
    }
    @IBAction func postaGiris(_ sender: AnyObject) {
        kayit.giris(viewController: self)
    }
    @IBAction func sayfaGerial(segue : UIStoryboardSegue){
    }
    


}
