//
//  ubicacion_modelo.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 24/02/26.
//
import Foundation

struct UbicacionModelo: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let nombre: String
    let urlImagen: String
    let detalles: [String]
}
