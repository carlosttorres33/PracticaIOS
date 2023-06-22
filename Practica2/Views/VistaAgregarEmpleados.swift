//
//  VistaAgregarEmpleados.swift
//  Practica2
//
//  Created by UNAM FCA 18 on 09/06/22.
//

import Foundation
import SwiftUI

struct VistaAgregarEmpleados: View {
    var datos: ControladoEmpleado
    
    @Environment(\.presentationMode) var presentationMode
    
    //Recibir mi objeto observable para agregar el comentario al arreglo
    @State var textoNombre = ""
    @State var fechaApellido = ""
    @State var textoArea = ""
    @State var roductividad = 100
    @State var Productividad : Int
    
    
    var body: some View {
        Form {
            //Agregar los textField para el formulario y demàs
            TextField("Nombre", text: $textoNombre)
            TextField("Apellido", text: $fechaApellido)
            TextField("Area", text: $textoArea)
            
            //Boton que reduce la productividad de empleado
            Button{
                roductividad = roductividad-1
            }label: {
                Text("-").foregroundColor(.red)
            }
            Text("\(roductividad)")
            //Boton que aumenta la productividad de empleado
            Button{
                roductividad = roductividad+1
            }label: {
                Text("+").foregroundColor(.blue)
            }
            
            Button {
                //Aqui vamos a agregar el comentario
                Productividad = roductividad
                datos.crearUsuario("person", textoNombre, fechaApellido, textoArea, Productividad)
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Agregar Empleado")
            }
        }
    }
}

