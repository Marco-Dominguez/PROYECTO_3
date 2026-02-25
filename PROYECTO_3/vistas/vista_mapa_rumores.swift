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
    @State private var nodoSeleccionado: NodoRumor? = nil
    
    @State private var escalaActual: CGFloat = 1.0
    @State private var escalaFinal: CGFloat = 0.5
    @State private var desplazamientoActual: CGSize = .zero
    @State private var desplazamientoFinal: CGSize = .zero
    
    var body: some View {
        GeometryReader { geometria in
            ZStack {
                // color de fondo
                Color(hex: 0x0E1621)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            nodoSeleccionado = nil
                        }
                    }
                VStack(alignment: .leading) {
                    // título
                    Text("Mapa de Rumores")
                        .font(.system(size: 32, design: .monospaced).bold())
                        .foregroundColor(Color(hex: 0x81C784))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical, 12)
                        .border(Color(hex: 0x4B6E9B), width: 2)
                        .padding(.horizontal, 30)
                        .padding(.top, 20)
                    
                    lienzo(geometria: geometria)
                        .offset(
                            x: desplazamientoActual.width + desplazamientoFinal.width,
                            y: desplazamientoActual.height + desplazamientoFinal.height
                        )
                        .scaleEffect(escalaActual * escalaFinal)
                    
                    capaDetalles()
                }
                
            }
            .gesture(gestosDelMapa)
        }
    }
    
    // area donde se muestran las tarjetas
    @ViewBuilder
    private func lienzo(geometria: GeometryProxy) -> some View {
        ZStack {
            // conexiones
            ForEach(mapa.conexiones) { conexion in
                if let origen = mapa.rumores.first(where: { $0.id == conexion.origenId }),
                   let destino = mapa.rumores.first(where: { $0.id == conexion.destinoId }) {
                    
                    ConexionRumor(
                        origen: calcularPosicion(origen.posicion, en: geometria),
                        destino: calcularPosicion(destino.posicion, en: geometria)
                    )
                }
            }
            
            // tarjetas de rumor
            ForEach(mapa.rumores) { rumor in
                TarjetaRumor(
                    estaSeleccionado: nodoSeleccionado?.id == rumor.id,
                    tituloTarjeta: rumor.titulo,
                    urlImagen: rumor.urlImagen,
                    colorTarjeta: rumor.colorTarjeta,
                    colorSobreTarjeta: rumor.colorSobreTarjeta,
                    tamaño: rumor.tamaño,
                    alTocar: {
                        withAnimation {
                            if nodoSeleccionado?.id == rumor.id {
                                nodoSeleccionado = nil
                            } else {
                                nodoSeleccionado = rumor
                            }
                        }
                    }
                )
                .position(calcularPosicion(rumor.posicion, en: geometria))
            }
        }
    }
    
    // panel de detalles
    @ViewBuilder
    private func capaDetalles() -> some View {
        if let seleccionado = nodoSeleccionado, !seleccionado.detalles.isEmpty {
            VStack {
                Spacer()
                DetallesRumor(detalles: seleccionado.detalles)
                    .padding(.bottom, 40)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
    }
    
    // manejo de gestos
    private var gestosDelMapa: some Gesture {
        SimultaneousGesture(
            MagnificationGesture()
                .onChanged { valor in
                    self.escalaActual = valor
                }
                .onEnded { valor in
                    self.escalaFinal *= self.escalaActual
                    self.escalaActual = 1.0
                },
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
    }
    
    // posicion de la pantalla
    private func calcularPosicion(_ posicion: CGPoint, en geometria: GeometryProxy) -> CGPoint {
        CGPoint(
            x: (geometria.size.width / 2) + posicion.x,
            y: (geometria.size.height / 2) + posicion.y
        )
    }
}

#Preview {
    VistaMapaRumores()
}
