//
//  conexion_rumor.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 16/02/26.
//

import SwiftUI

// flechas entre rumores
struct ConexionRumor: View {
    let origen: CGPoint
    let destino: CGPoint
    
    var body: some View {
        Path { punto in
            punto.move(to: origen)
            punto.addLine(to: destino)
            
            // flecha en punto medio
            let centroX = (origen.x + destino.x) / 2
            let centroY = (origen.y + destino.y) / 2
            let puntoMedio = CGPoint(x: centroX, y: centroY)
            
            let angulo = atan2(destino.y - origen.y, destino.x - origen.x)
            let anguloReversa = angulo + .pi
            let tamañoFlecha: CGFloat = 20
            
            //puntas
            let punta1 = CGPoint(
                x: centroX + tamañoFlecha * cos(anguloReversa - .pi / 6),
                y: centroY + tamañoFlecha * sin(anguloReversa - .pi / 6)
            )
            
            let punta2 = CGPoint(
                x: centroX + tamañoFlecha * cos(anguloReversa + .pi / 6),
                y: centroY + tamañoFlecha * sin(anguloReversa + .pi / 6)
            )
            
            // flecha
            punto.move(to: puntoMedio)
            punto.addLine(to: punta1)
            punto.move(to: puntoMedio)
            punto.addLine(to: punta2)
        }
        // color
        .stroke(Color.gray.opacity(0.8), style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
    }
}

#Preview {
    ZStack {
        Color(hex: 0x0E1621).ignoresSafeArea()
        ConexionRumor(
            origen: CGPoint(x: 100, y: 100),
            destino: CGPoint(x: 300, y: 400)
        )
    }
}
