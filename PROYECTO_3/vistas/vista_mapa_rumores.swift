//
//  vista_mapa_rumores.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 16/02/26.
//
import SwiftUI
internal import Combine


// mapa de rumores
struct VistaMapaRumores: View {
    @StateObject private var mapa = MapaRumores()
    @State private var escalaActual: CGFloat = 1.0
    @State private var escalaFinal: CGFloat = 1.0
    @State private var desplazamientoActual: CGSize = .zero
    @State private var desplazamientoFinal: CGSize = .zero
    
    var body: some View {
        GeometryReader { geometria in
            ZStack {
                // color de fondo
                Color(hex: 0x0E1621)
                    .ignoresSafeArea()
                
                ZStack {
                    
                    // conexiones
                    ForEach(mapa.conexiones) { conexion in
                        if let origen = mapa.rumores.first(where: { $0.id == conexion.origenId }),
                           let destino = mapa.rumores.first(where: { $0.id == conexion.destinoId }) {
                            
                            ConexionRumor(
                                origen: CGPoint(
                                    x: (geometria.size.width / 2) + origen.posicion.x,
                                    y: (geometria.size.height / 2) + origen.posicion.y
                                ),
                                destino: CGPoint(
                                    x: (geometria.size.width / 2) + destino.posicion.x,
                                    y: (geometria.size.height / 2) + destino.posicion.y
                                )
                            )
                        }
                    }
                    
                    // tarjetas de rumor
                    ForEach(mapa.rumores) { rumor in
                        TarjetaRumor(
                            tituloTarjeta: rumor.titulo,
                            urlImagen: rumor.urlImagen,
                            colorTarjeta: rumor.colorTarjeta,
                            colorSobreTarjeta: rumor.colorSobreTarjeta,
                            tamaño: rumor.tamaño
                        )
                        .position(
                            x: (geometria.size.width / 2) + rumor.posicion.x,
                            y: (geometria.size.height / 2) + rumor.posicion.y
                        )
                    }
                }
                // desplazamiento
                .offset(
                    x: desplazamientoActual.width + desplazamientoFinal.width,
                    y: desplazamientoActual.height + desplazamientoFinal.height
                )
                // escala / zoom
                .scaleEffect(escalaActual * escalaFinal)
            }
            .gesture(
                SimultaneousGesture(
                    // escala
                    MagnificationGesture()
                        .onChanged { valor in
                            self.escalaActual = valor
                        }
                        .onEnded { valor in
                            self.escalaFinal *= self.escalaActual
                            self.escalaActual = 1.0
                        },
                    // deslizamiento
                    DragGesture()
                        .onChanged { valor in
                            self.desplazamientoActual = valor.translation
                        }
                        .onEnded { valor in
                            self.desplazamientoFinal.width += self.desplazamientoActual.width
                            self.desplazamientoFinal.height += self.desplazamientoActual.height
                            self.desplazamientoActual = .zero
                        }
                )
            )
        }
    }
}

#Preview {
    VistaMapaRumores()
}
