//
//  ViewController.swift
//  WebGiris
//
//  Created by Vural Ozsen on 26.09.2016.
//  Copyright © 2016 Vural Ozsen. All rights reserved.
//

import UIKit
import FirebaseAuth


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    
    }

  @IBOutlet weak var epostaField: UITextField!
    @IBOutlet weak var sifreField: UITextField!
    @IBAction func postaKayit(_ sender: AnyObject) {
        kaydet()
    }
    @IBAction func postaGiris(_ sender: AnyObject) {
        giris()
    }
    @IBAction func sayfaGerial(segue : UIStoryboardSegue){
    }
    
    func kaydet () {
        
            let eposta = epostaField.text
            let sifre = sifreField.text
        
        FIRAuth.auth()?.createUser(withEmail: eposta!, password: sifre!){ (user, error) in
            
            if error != nil {
                print("Kayıtta sıkıntı var hacı")}
            else
            {
                self.epostaField.text = ""
                self.sifreField.text = ""
                print("Kayıt yapıldı")
                
            }
        }
    }

    func showAlertMsg(title: String, message: String){
     
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alert = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        present(alertController, animated: true, completion: nil)
        alertController.addAction(alert)
    }
    
    func giris () {
        
        let eposta = epostaField.text
        let sifre = sifreField.text
        
        FIRAuth.auth()?.signIn(withEmail: eposta!, password: sifre!){ (user, error) in
            
            if error != nil {
                let title  = " Giriş Yapılamadı! "
                let message = " Kullanıcı adınızı ya da şifrenizi hatalı girdiniz"
                self.showAlertMsg (title: title ,message: message)
            }
               else
            {
                self.epostaField.text = ""
                self.sifreField.text = ""
                self.performSegue(withIdentifier: "loggedInPage", sender: nil)
                
            }
        }
    }

}
