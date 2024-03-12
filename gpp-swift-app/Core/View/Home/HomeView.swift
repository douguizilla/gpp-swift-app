//
//  HomeView.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 07/03/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var navigation : NavigationManager
    
    @StateObject var viewModel = InnerViewModel()
    
    @State private var open = false
    @State private var tabIndex = 0
    var body: some View {
        SideBarContainer(open: $open){
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
                    
                    HStack(spacing: 5){
                        
                        Text("11621BCC013")
                            .font(.subheadline)
                        
                        Text("-")
                        
                        Text("Mestrado")
                            .font(.subheadline)
                        
                    }
                    
                    Text("Redes complexas")
                        .font(.subheadline)
                        .italic()
                }
                .multilineTextAlignment(.center)
                
                ScrollView{
                    VStack {
                        MenuButton(
                            systemName: "person.circle",
                            label: "Perfil"
                        ){
                            navigation.navigate(to: HomeScreen.profile)
                        }
                        
                        MenuButton(
                            systemName: "lock",
                            label: "Alterar senha"
                        ){
                            navigation.navigate(to: HomeScreen.changePassword)
                        }
                        
                        MenuButton(
                            systemName: "gear",
                            label: "Configurações"
                        ){
                            navigation.navigate(to: HomeScreen.settings)
                        }
                        
                        MenuButton(
                            systemName: "questionmark.circle",
                            label: "Ajuda"
                        ){
                            navigation.navigate(to: HomeScreen.help)
                        }
                    }
                }
                
                Spacer()
                
                MenuButton(
                    systemName: "rectangle.portrait.and.arrow.forward",
                    label: "Sair"
                ){
                    navigation.logout()
                }
                .padding(.bottom)
                
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
                            navigation.navigate(to: HomeScreen.messages)
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
                            
                            NextGoalCard(goal: Goal.sample)
                            
                            MessageCard(messages: Message.sampleList)
                                .padding(.bottom)
                            
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
                    .environmentObject(viewModel)
            case .publications:
                PublicationsView()
                    .environmentObject(viewModel)
            case .dissertation:
                DissertationView()
                    .environmentObject(viewModel)
            case .goals:
                GoalsView()
                    .environmentObject(viewModel)
            case .profile:
                ProfileView()
                    .environmentObject(viewModel)
            case .changePassword:
                ChangePasswordView()
                    .environmentObject(viewModel)
            case .settings:
                SettingsView()
                    .environmentObject(viewModel)
            case .help:
                HelpView()
                    .environmentObject(viewModel)
            case .messages:
                MessagesView()
                    .environmentObject(viewModel)
            }
        }
        .navigationDestination(for: Goal.self) { goal in
            GoalDetailView(goal: goal)
                .environmentObject(viewModel)
        }
        .navigationDestination(for: Message.self) { message in
            MessageDetailView(message: message)
                .environmentObject(viewModel)
        }
        
    }
    
    func NextGoalCard(goal: Goal)->some View {
        VStack(alignment: .leading, spacing: 10){
            Text("Sua próxima entrega:")
                .font(.subheadline)
            
            NavigationLink(value: goal) {
                HStack(alignment: .top){
                    InfoCircle(topLabel: "25", botLabel: "JAN")
                    GoalInfo(goal: goal)
                }
                .foregroundStyle(Color.primary)
            }
            
            Divider()
            
            Button{
                navigation.navigate(to: HomeScreen.goals)
            }label: {
                HStack{
                    Text("ver todos")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                }
                .padding(.bottom, 5)
            }
            
        }
        .grayBackground(8)
    }
    
    func MessageCard(messages: [Message])-> some View {
        VStack{
            TabView(selection: $tabIndex) {
                ForEach(messages.indices, id: \.self){ index in
                    let message = messages[index]
                    NavigationLink(value: message) {
                        VStack(alignment: .leading){
                            Text(message.title)
                                .font(.headline)
                            
                            Text(message.text)
                                .multilineTextAlignment(.leading)
                                .font(.subheadline)
                        }
                        .padding(.vertical, 10)
                        .tag(index)
                        .foregroundStyle(Color.primary)
                    }
                    
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 150)
            .grayBackground(8)
            
            HStack{
                ForEach(messages.indices, id:\.self){ index in
                    Button{
                        withAnimation{
                            tabIndex = index
                        }
                    }label: {
                        Circle()
                            .foregroundStyle(tabIndex == index ? Color(.systemGray) : Color(.systemGray3))
                            .frame(width: 10, height: 10)
                    }
                }
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
                    .font(.caption2)
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
