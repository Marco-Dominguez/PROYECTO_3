//
//  tamaño_tarjeta.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 24/02/26.
//

import CoreFoundation

// definiciones de tamaño por defecto
enum TamañoTarjeta {
    case pequeña
    case mediana
    case grande
    
    // tamaños por defecto
    var dimension: CGFloat {
        switch self {
        case .pequeña: return 100
        case .mediana: return 160
        case .grande: return 220
        }
    }
    
    // tamaños de fuente por defecto
    var tamañoFuente: CGFloat {
        switch self {
        case .pequeña: return 12
        case .mediana: return 20
        case .grande: return 30
        }
    }
}
