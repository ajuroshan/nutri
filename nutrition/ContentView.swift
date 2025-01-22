//
//  ContentView.swift
//  nutrition
//
//  Created by Ajay Krishna U on 22/01/25.
//



import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            ContentStack()
        }
    }
}

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Color("bg_color")
                .edgesIgnoringSafeArea(.all)
            
            Image("bg_elements")
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
                .offset(x: -19)
        }
    }
}

struct ContentStack: View {
    var body: some View {
        VStack {
            HeaderText()
            
            Spacer()
            
            TitleText()
            
            LoginButton()
            
            CreateAccountText()
        }
        .padding(.bottom, 57)
    }
}

struct HeaderText: View {
    var body: some View {
        Text("Later")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .font(.system(size: 18))
            .padding()
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 10)
    }
}

struct TitleText: View {
    var body: some View {
        Text("Help your path to health goals with happiness")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .font(.system(size: 25))
            .padding()
            .multilineTextAlignment(.center)
    }
}

struct LoginButton: View {
    var body: some View {
        Button {
            print("do something")
        } label: {
            Text("Login")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .font(.system(size: 20))
                .padding(.vertical, 18)
                .frame(maxWidth: 327)
                .background(Color("button_color"))
                .cornerRadius(16)
                .padding(.bottom, 10)
        }
    }
}

struct CreateAccountText: View {
    var body: some View {
        Text("Create New Account")
            .bold()
            .foregroundColor(.white)
            .font(.system(size: 16))
            .padding(.top, 1)
    }
}

#Preview {
    ContentView()
}
