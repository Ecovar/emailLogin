//
//  logIn.swift
//  WebGiris
//
//  Created by Vural Ozsen on 17.10.2016.
//  Copyright © 2016 Vural Ozsen. All rights reserved.
//

import Foundation
import FirebaseAuth

class kayit{

    static func kaydet (viewController : ViewController){
    
    let eposta = viewController.epostaField.text
    let sifre = viewController.sifreField.text
    
    FIRAuth.auth()?.createUser(withEmail: eposta!, password: sifre!){ (user, error) in
        
        if error != nil {
            print("Kayıtta sıkıntı var hacı")}
        else
        {
            viewController.epostaField.text = ""
            viewController.sifreField.text = ""
            print("Kayıt yapıldı")
            
        }
    }
}

static func giris (viewController : ViewController) {
    
    let eposta = viewController.epostaField.text
    let sifre = viewController.sifreField.text
    
    FIRAuth.auth()?.signIn(withEmail: eposta!, password: sifre!){ (user, error) in
        
        if error != nil {
            
            popUpMesaj.showAlertMsg(viewController:viewController )
            
        }
        else
        {
            viewController.epostaField.text = ""
            viewController.sifreField.text = ""
            viewController.performSegue(withIdentifier: "loggedInPage", sender: nil)
            
        }
    }
}
}
