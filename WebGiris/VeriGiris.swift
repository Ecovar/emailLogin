//
//  VeriGiris.swift
//  WebGiris
//
//  Created by Vural Ozsen on 28.09.2016.
//  Copyright © 2016 Vural Ozsen. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseAuth



class VeriViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBOutlet weak var adField: UITextField!
    
    @IBOutlet weak var soyadField: UITextField!
    @IBAction func gonderButton(_ sender: AnyObject) {
        
        gonder()
    }

    @IBAction func epostaCikis(_ sender: AnyObject) {
        
        try! FIRAuth.auth()!.signOut()
        performSegue(withIdentifier: "ilkSayfayaDon", sender: nil)
        
    }

    func gonder (){
        
        let ad =  adField.text
        let SoyAd = soyadField.text
        
        let kayit : [ String : AnyObject  ] = [ " Adınız": ad! as AnyObject, "Soyadınız" :SoyAd! as AnyObject ]
        
        let dataBase = FIRDatabase.database().reference()
        dataBase.child("Rehber").childByAutoId().setValue(kayit)
        
    }















}
