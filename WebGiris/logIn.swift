//
//  logIn.swift
//  WebGiris
//
//  Created by Vural Ozsen on 17.10.2016.
//  Copyright © 2016 Vural Ozsen. All rights reserved.
//

import Foundation
import FirebaseAuth

struct kayit{ // struct ya da class  farketmiyor daha sınra kontrol gerekebilir

    static func kaydet (viewController : ViewController){ //static olmaz ise çağrılammıyor hata veriyor
    
    let eposta = viewController.epostaField.text
    let sifre = viewController.sifreField.text
    
    FIRAuth.auth()?.createUser(withEmail: eposta!, password: sifre!){ (user, error) in //Firebase Auth kullanıcı kayıt
        
        if error != nil { // eğer hata verirse hatayı yazdır
            print("Kayıtta sıkıntı var hacı")}
        else
        {
            viewController.epostaField.text = "" // hata vermez ise textfield verilerini boşalt
            viewController.sifreField.text = ""
            print("Kayıt yapıldı")
            
        }
    }
}

static func giris (viewController : ViewController) {
    
    let eposta = viewController.epostaField.text
    let sifre = viewController.sifreField.text
    
    FIRAuth.auth()?.signIn(withEmail: eposta!, password: sifre!){ (user, error) in // Firebase kullanıcı giriş
        
        if error != nil {
            
            popUpMesaj.showAlertMsg(viewController:viewController ) //pop up mesajı göster self yerine viewController kullanıldı çünkü viewController farklı sayfada (aynı olsa idid self yazıyorduk)
            
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
