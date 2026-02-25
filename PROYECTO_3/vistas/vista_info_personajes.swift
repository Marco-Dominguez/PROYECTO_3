//
//  vista_info_personajes.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 16/02/26.
//
import SwiftUI

struct VistaInfoPersonajes: View {
    @StateObject private var viewModel = GaleriaPersonajes()
    @State private var personajeSeleccionado: PersonajeModelo? = nil
    
    let columnas = [
        GridItem(.adaptive(minimum: 160), spacing: 20)
    ]
    
    var body: some View {
        ZStack {
            // fondo
            Color(hex: 0x0E1621)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                // titulo
                Text("Personajes")
                    .font(.system(size: 32, design: .monospaced).bold())
                    .foregroundColor(Color(hex: 0x81C784))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 12)
                    .border(Color(hex: 0x4B6E9B), width: 2)
                    .padding(.horizontal, 30)
                    .padding(.top, 20)
                
                // galeria
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columnas, spacing: 30) {
                        ForEach(viewModel.personajes) { personaje in
                            TarjetaPersonaje(personaje: personaje) {
                                withAnimation(.easeInOut) {
                                    personajeSeleccionado = personaje
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                }
            }
            
            // detalles
            if let personaje = personajeSeleccionado {
                VistaDetallesPersonaje(personaje: personaje) {
                    withAnimation(.easeInOut) {
                        personajeSeleccionado = nil
                    }
                }
                .zIndex(1)
                .transition(.opacity.combined(with: .scale(scale: 0.95)))
            }
        }
    }
}

#Preview {
    VistaInfoPersonajes()
}
