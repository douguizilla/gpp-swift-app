//
//  SideBarContainer.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 09/03/24.
//

import SwiftUI

struct SideBarContainer<SideMenu, Content>: View where SideMenu : View, Content : View {
    @Binding var open : Bool
    
    @State private var offset: CGFloat = 0
    @State private var lastStoredOffset: CGFloat = 0
    
    @GestureState private var gestureOffset: CGFloat = 0
    
    @ViewBuilder
    var sideMenu: () -> SideMenu
    
    @ViewBuilder
    var content: () -> Content
    
    var body: some View {
        let sideBarWidth = getWidth() - 90
        VStack{
            HStack(spacing: 0){
                //SideBarMenu
                sideMenu()
                .frame(width: getWidth() - 90)
                .frame(maxHeight: .infinity)
                .background(
                    Color.primary
                        .opacity(0.04)
                        .ignoresSafeArea(.container, edges: .vertical)
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                
                //Main Tab View
                content()
                .frame(width: getWidth(), height: getHeight())
                .overlay(
                    Rectangle()
                        .fill(
                            Color.primary
                                .opacity(Double((offset / sideBarWidth) / 2))
                        )
                        .ignoresSafeArea(.container, edges: .vertical)
                        .onTapGesture{
                            withAnimation {
                                open.toggle()
                            }
                        }
                        .overlay{
                            Text("Fechar")
                                .bold()
                                .frame(height: getHeight() - 100, alignment: .bottom)
                                .frame(width: getWidth() - 40, alignment: .leading)
                                .foregroundStyle(Color(.systemBackground))
                                .padding(.horizontal)
                                .opacity(Double((offset / sideBarWidth)))
                        }
                )
            }
            .frame(width: getWidth() + sideBarWidth)
            .offset(x: -sideBarWidth / 2)
            .offset(x: offset > 0 ? offset : 0)
            .gesture(
                DragGesture()
                    .updating($gestureOffset, body: { value, out, _ in
                        out = value.translation.width
                        
                    })
                    .onEnded(onEnd(value:))
            )
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden)
        }
        .animation(.easeOut, value: offset == 0)
        .onChange(of: open) { newValue in
            if open && offset == 0 {
                offset = sideBarWidth
                lastStoredOffset = offset
            }
            
            if !open && offset == sideBarWidth {
                offset = 0
                lastStoredOffset = 0
            }
        }
        .onChange(of: gestureOffset) { newValue in
            onChange()
        }
    }
    
    func onChange(){
        let sideBarWidth = getWidth() - 90
        
        offset = (gestureOffset != 0) ? (gestureOffset + lastStoredOffset < sideBarWidth ? gestureOffset + lastStoredOffset : offset) : offset
    }
    
    func onEnd(value: DragGesture.Value){
        let sideBarWidth = getWidth() - 90
        
        let translation = value.translation.width
        withAnimation {
            if translation > 0 {
                if translation > (sideBarWidth / 2) {
                    offset = sideBarWidth
                    open = true
                }else{
                    
                    if offset == sideBarWidth {
                        return
                    }
                    
                    offset = 0
                    open = false
                }
            }else {
                if -translation > (sideBarWidth / 2) {
                    offset = 0
                    open = false
                }else{
                    
                    if offset == 0 || !open {
                        return
                    }
                    
                    offset = sideBarWidth
                    open = true
                }
            }
        }
        
        lastStoredOffset = offset
    }
}


extension View {
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
    
    func getWidth()->CGFloat{
        return getRect().width
    }
    
    func getHeight()->CGFloat{
        return getRect().height
    }
    
    
}

