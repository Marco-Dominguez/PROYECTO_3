//
//  conexion.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 24/02/26.
//

import Foundation

// identifiable como protocolo para id
struct Conexion: Identifiable {
    var id: String = UUID().uuidString
    let origenId: String
    let destinoId: String
}
