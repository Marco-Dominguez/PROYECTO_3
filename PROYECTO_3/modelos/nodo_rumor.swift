//
//  nodo_rumor.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 24/02/26.
//

import Foundation
import SwiftUI

// identifiable como protocolo para id
struct NodoRumor: Identifiable {
    var id: String = UUID().uuidString
    let titulo: String
    let urlImagen: String
    let colorTarjeta: Color
    let colorSobreTarjeta: Color
    let posicion: CGPoint
    let tamaño: TamañoTarjeta
}
