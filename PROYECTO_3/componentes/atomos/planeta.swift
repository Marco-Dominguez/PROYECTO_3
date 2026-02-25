//
//  planeta.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 16/02/26.
//
import SwiftUI

struct Planeta: View {
    let planeta: PlanetaModelo
    let alTocar: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            
            // imagen
            AsyncImage(url: URL(string: planeta.urlImagen)) { fase in
                if let imagen = fase.image {
                    imagen
                        .resizable()
                        .scaledToFill()
                } else if fase.error != nil {
                    Color.gray.opacity(0.3)
                } else {
                    ProgressView()
                }
            }
            .frame(width: planeta.tamaño, height: planeta.tamaño)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white.opacity(0.3), lineWidth: 3))
            .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
            .onTapGesture {
                alTocar()
            }
            
            // título del planeta
            Text(planeta.nombre)
                .font(.system(size: 16, design: .monospaced).bold())
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    ZStack {
        Color(hex: 0x0E1621).ignoresSafeArea()
        Planeta(
            planeta: PlanetaModelo(nombre: "Lumbre", urlImagen: "https://outerwilds.ventures/assets/TH_VILLAGE-VoBiOHgy.jpg", tamaño: 150, ubicaciones: []),
            alTocar: {}
        )
    }
}
