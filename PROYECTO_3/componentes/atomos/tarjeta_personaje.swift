//
//  tarjeta_personaje.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 24/02/26.
//
import SwiftUI

struct TarjetaPersonaje: View {
    let personaje: PersonajeModelo
    let alTocar: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            
            // imagen
            AsyncImage(url: URL(string: personaje.urlImagen)) { fase in
                Color.clear
                    // 3:4
                    .aspectRatio(3.0 / 4.0, contentMode: .fit)
                    .overlay(
                        Group {
                            if let imagen = fase.image {
                                imagen
                                    .resizable()
                                    .scaledToFill()
                            } else {
                                Color.gray.opacity(0.3)
                            }
                        }
                    )
                    .clipped()
            }
            .padding(.horizontal, 8)
            .padding(.top, 8)
            
            // nombre
            Text(personaje.nombre)
                .foregroundColor(.black)
                .font(.system(size: 18, design: .monospaced).bold())
                .multilineTextAlignment(.center)
                .padding(.vertical, 12)
                .padding(.horizontal, 8)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(width: 160)
        .background(Color(hex: 0xB4764B))
        .onTapGesture {
            alTocar()
        }
    }
}

#Preview {
    ZStack {
        Color(hex: 0x0E1621).ignoresSafeArea()
        TarjetaPersonaje(personaje: PersonajeModelo(nombre: "Gabbro", descripcion: "", urlImagen: "https://outerwilds.ventures/assets/TH_VILLAGE-VoBiOHgy.jpg", objetos: [])) {}
    }
}
