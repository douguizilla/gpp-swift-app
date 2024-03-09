//
//  HomeView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 07/03/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var navigation : NavigationManager
    @State private var open = true
    var body: some View {
        SideBarContainer(open: $open) {
            VStack(spacing: 20){
                HStack{
                    Button{
                        open.toggle()
                    }label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                            .foregroundStyle(.blue)
                    }
                    .horizontalAlignment(.leading)
                }
                
                ZStack(alignment: .bottomTrailing){
                    Circle()
                        .strokeBorder(.blue, lineWidth: 1)
                        .background(Circle().fill(.cyan))
                        .frame(width: 100, height: 100)
                    
                    
                    Image(systemName: "pencil")
                        .foregroundStyle(Color.primary)
                        .padding(8)
                        .background(
                            Circle()
                                .foregroundStyle(Color(.systemGray6))
                        )
                }
                
                VStack(spacing: 6){
                    Text("Douglas Gomes")
                        .font(.headline)
                    
                    Text("11621BCC013")
                        .font(.subheadline)
                    
                    Text("Redes complexas")
                        .font(.subheadline)
                        .italic()
                }
                .multilineTextAlignment(.center)
                
                MenuButton(
                    systemName: "person.circle",
                    label: "Perfil"
                ){
                    
                }
                
                MenuButton(
                    systemName: "lock",
                    label: "Alterar senha"
                ){
                    
                }
                
                MenuButton(
                    systemName: "gear",
                    label: "Configurações"
                ){
                    
                }
                
                MenuButton(
                    systemName: "questionmark.circle",
                    label: "Ajuda"
                ){
                    
                }
                
                Spacer()
                
                MenuButton(
                    systemName: "rectangle.portrait.and.arrow.forward",
                    label: "Sair"
                ){
                    
                }
                
            }
            .verticalAlignment(.top)
            .padding(.horizontal)
        } content: {
            VStack{
                VStack{
                    HStack{
                        Button{
                            open.toggle()
                        }label: {
                            Circle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.blue)
                        }
                        
                        Spacer()
                        
                        Button{
                            
                        }label: {
                            Image(systemName: "ellipsis.message")
                                .resizable()
                                .bold()
                                .frame(width: 25, height: 25)
                        }
                        .foregroundColor(.blue)
                    }
                    .padding(.horizontal)
                    .paddingNotch()
                    
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
                                    navigation.navigate(to: HomeScreen.subjects)
                                }
                                .grayBackground()
                                
                                Spacer()
                                
                                GButton(
                                    systemName: "doc",
                                    label: "Publicações"
                                ){
                                    navigation.navigate(to: HomeScreen.publications)
                                }
                                .grayBackground()
                                
                                Spacer()
                                
                                GButton(
                                    systemName: "pencil.and.list.clipboard",
                                    label: "Dissertação"
                                ){
                                    navigation.navigate(to: HomeScreen.dissertation)
                                }
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
                            .padding(.vertical, 10)
                            .grayBackground(8)
                            
                        }
                        .padding()
                    }
                }
            }
        }
        .navigationDestination(for: HomeScreen.self) { screen in
            switch screen {
            case .subjects:
                SubjectsView()
            case .publications:
                PublicationsView()
            case .dissertation:
                DissertationView()
            case .profile:
                ProfileView()
            case .changePassword:
                ChangePasswordView()
            case .settings:
                SettingsView()
            case .help:
                HelpView()
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
    
    func MenuButton(
        systemName: String,
        label: String,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action){
            HStack(spacing: 22){
                Image(systemName: systemName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(Color.primary)
                
                Text(label)
                    .font(.title3)
                    .foregroundStyle(Color.primary)
                    .bold()
                
                Spacer()
            }
            .padding(8)
            .padding(.vertical, 3)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.bar.opacity(0.4))
            )
            .contentShape(
                RoundedRectangle(cornerRadius: 12)
            )
        }
    }
}

#Preview {
    NavigationStack{
        HomeView()
    }
    .environmentObject(NavigationManager())
}
