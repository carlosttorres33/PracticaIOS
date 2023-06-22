//
//  ContentView.swift
//  Practica2
//. Toral Torres Carlos Uriel
//  Created by UNAM FCA 18 on 18/04/22.
//

import SwiftUI
import CoreData

//Content View
struct ContentView: View {

    var body: some View {
        //Muestra la vista de la pantalla principal
        VistaPrincipal().environmentObject(ControladoEmpleado())
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
    VistaPrincipal()
    }
}
