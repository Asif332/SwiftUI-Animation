//
//  HomeView.swift
//  SideMenu-SwiftUI
//
//  Created by Arvind on 23/11/20.
//

import SwiftUI
import UIKit

struct HomeView : View {
    @State private var buttonIndex = 0
    @State private var isToggle = false
    @State private var isRotateTop = false
    @State private var isCenterLineHidden = false
    @State private var isRotateBottom = false
    
    var body: some View {
        
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Image("profile")
                        .frame(width: 130 ,height: 130)
                        .cornerRadius(65)
                    
                    Text("Hey")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    Text("Arvind Patel")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Divider()
                        .frame(width: 150, height: 1)
                        .background(Color.white)
                        .padding(.vertical, 30)
                    
                    //MARK:- Home Button
                    Button(action: {
                        self.buttonIndex = 0
                        withAnimation{
                            self.isToggle.toggle()
                        }
                    }) {
                        MenuButton(imageName: "home-icon", menuName: "Home", buttonIndex: self.buttonIndex, buttonPosition: 0)
                    }
                    
                    //MARK:- My Orders Button
                    Button(action: {
                        self.buttonIndex = 1
                        withAnimation{
                            self.isToggle.toggle()
                        }
                    }) {
                        MenuButton(imageName: "order-icon", menuName: "Orders", buttonIndex: self.buttonIndex, buttonPosition: 1)
                    }
                    
                    //MARK:- My Wishlist
                    Button(action: {
                        self.buttonIndex = 2
                        withAnimation{
                            self.isToggle.toggle()
                        }
                    }) {
                        MenuButton(imageName: "wishlist", menuName: "Wishlist", buttonIndex: self.buttonIndex, buttonPosition: 2)
                    }
                    
                    //MARK:- Contact us
                    Button(action: {
                        self.buttonIndex = 3
                        withAnimation{
                            self.isToggle.toggle()
                        }
                    }) {
                        MenuButton(imageName: "contact-icon", menuName: "About", buttonIndex: self.buttonIndex, buttonPosition: 3)
                    }
                    
                    Divider()
                        .frame(width: 150, height: 1)
                        .background(Color.white)
                        .padding(.vertical,30)
                    
                    Button(action: {}) {
                        MenuButton(imageName: "logout", menuName: "Logout", buttonIndex: self.buttonIndex, buttonPosition: 4)
                    }
                }
                .padding(.top, 22)
                .padding(.horizontal, 20)
                Spacer(minLength: 0)
            }
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            
            // MainView...
            
            VStack(spacing: 0) {
                HStack(spacing: 15) {
                   
                    VStack(alignment: .center, spacing: 5) {
                                    
                        Rectangle()
                            .frame(width: 35, height: 5)
                            .cornerRadius(4)
                            .rotationEffect(
                            .degrees(isRotateTop ? 35 : 0), anchor: .leading)
                            .foregroundColor(Color.gray)
                        
                        Rectangle()
                            .frame(width: 35, height: 5)
                            .cornerRadius(4)
                            .scaleEffect(isCenterLineHidden ? 0 : 1)
                            .opacity(isCenterLineHidden ? 0 : 1)
                            .foregroundColor(Color.gray)
                        
                        Rectangle()
                            .frame(width: 35, height: 5)
                            .cornerRadius(4)
                            .rotationEffect(
                            .degrees(isRotateTop ? -35 : 0), anchor:.leading)
                            .foregroundColor(Color.gray)
                        
                    }.animation(Animation
                        .interpolatingSpring(stiffness: 100, damping: 10))
                        .onTapGesture {
                        self.isRotateTop.toggle()
                        self.isRotateBottom.toggle()
                        self.isCenterLineHidden.toggle()
                        self.isToggle.toggle()
                    }
                     
                    if (self.buttonIndex == 0) {
                        NavigationLabel(title: "Home")
                    }
                    
                    if (self.buttonIndex == 1) {
                        NavigationLabel(title: "Orders")
                    }
                    
                    if (self.buttonIndex == 2) {
                        NavigationLabel(title: "WishList")
                    }
                    
                    if (self.buttonIndex == 3) {
                        NavigationLabel(title: "About")
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding()
                
                GeometryReader {_ in
                    VStack{
                        if buttonIndex == 0 {
                            RootView()
                        }
                        
                        if buttonIndex == 1 {
                            Orders()
                        }
                        
                        if buttonIndex == 2 {
                            Wishlist()
                        }
                        
                        if buttonIndex == 3 {
                            Abouts()
                        }
                    }
                }
            }
            .background(buttonIndex == 0 ? Color.getHomeColor() : (buttonIndex == 1 ? Color.getColor1() : (buttonIndex == 2 ? Color.getColor2() : Color.getColor3())))      
            .cornerRadius(isToggle ? 30 : 0)
            .scaleEffect(isToggle ? 0.9 : 1)
            .offset(x: isToggle ? UIScreen.main.bounds.width / 2 : 0, y: self.isToggle ? 15 : 0)
            .rotationEffect(.init(degrees: self.isToggle ? -5 : 0))
            .animation(Animation.default)
        }
        .background(Color.GetSideMenuBGColor().edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
}
