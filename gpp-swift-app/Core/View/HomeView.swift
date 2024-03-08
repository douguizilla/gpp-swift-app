//
//  HomeView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 07/03/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var navigation : NavigationManager
    
    var body: some View {
        VStack{
            ScrollView{
                VStack(spacing: 16){
                    
                    Text("Olá, Douglas!")
                        .font(.largeTitle)
                        .bold()
                        .horizontalAlignment(.leading)
                    
                    
                    ProgressBar(
                        title: "Seus resultados:",
                        value: 29,
                        total: 44,
                        label: "créditos totais"
                    )
                    .grayBackground(8)
                    
                    HStack(spacing: 5){
                        GButton(
                            systemName: "studentdesk",
                            label: "Disciplinas"
                        ){
                            navigation.navigate(to: .subjects)
                        }
                        .grayBackground()
                        
                        Spacer()
                        
                        GButton(
                            systemName: "doc",
                            label: "Publicações"
                        )
                        .grayBackground()
                        
                        Spacer()
                        
                        GButton(
                            systemName: "pencil.and.list.clipboard",
                            label: "Dissertação"
                        )
                        .grayBackground()
                        
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("Sua próxima entrega:")
                            .font(.headline)
                        
                        HStack(alignment: .top){
                            VStack{
                                Text("25")
                                Text("JAN")
                            }
                            .bold()
                            .foregroundColor(.white)
                            .font(.caption)
                            .padding()
                            .background(
                                Circle()
                                    .foregroundColor(.blue)
                            )
                            
                            VStack(alignment: .leading){
                                Text("Marco 1 - 25/01/2024 (Hoje)")
                                    .font(.headline)
                                Text("Status: pendente")
                                    .font(.subheadline)
                                Text("Descrição aqui quando tiver uma dispon[ivel uashduahsduahsd audhuashduhasd ")
                                    .font(.subheadline)
                                    .lineLimit(2)
                            }
                        }
                        
                        Divider()
                        
                        HStack{
                            Text("ver todos")
                                .font(.subheadline)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        .padding(.bottom, 5)
                        
                    }
                    .grayBackground(8)
                    
                    VStack(alignment: .leading){
                        Text("Recados")
                            .font(.headline)
                        
                        Text(verbatim: .lorenIpsum)
                    }
                    .grayBackground(8)
                    
                }
                .padding()
            }
        }
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.blue)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    
                }label: {
                    Image(systemName: "ellipsis.message")
                }
                .foregroundColor(.blue)
            }
        }
        .navigationDestination(for: Screen.self) { screen in
            switch screen {
            case .subjects:
                SubjectsView()
            default:
                Text("")
            }
        }
    }
    
    func GButton(
        iconName: String = "",
        systemName: String = "",
        label: String,
        action: @escaping () -> Void = {}
    ) -> some View {
        Button{
            action()
        }label: {
            VStack(spacing: 10){
                Image(systemName: systemName)
                
                Text(label)
                    .fontWeight(.semibold)
                    .font(.caption)
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(.primary)
            .padding(16)
        }
    }
}

#Preview {
    NavigationStack{
        HomeView()
    }
}
