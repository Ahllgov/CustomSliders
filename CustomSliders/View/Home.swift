//
//  Home.swift
//  CustomSliders
//
//  Created by Магомед Ахильгов on 19.06.2022.
//

import SwiftUI

struct Home: View {
    
    @State var bill: CGFloat = 600
    
    @State var payers = [
        Payer(image: "animoji1", name: "Andy", bgColor: Color("animojiColor1")),
        Payer(image: "animoji2", name: "Cody", bgColor: Color("animojiColor2")),
        Payer(image: "animoji3", name: "Sandy", bgColor: Color("animojiColor3"))
    ]
    
    @State var pay = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(Color("card"))
                            .padding()
                            .background(Color.black.opacity(0.25))
                            .cornerRadius(15)
                    }
                    Spacer()
                }
                .padding()
                
                VStack(spacing: 15) {
                    Button {
                        
                    } label: {
                        Text("Recipt")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color("bg"))
                            .cornerRadius(12)
                    }
                    Line()
                        .stroke(Color.black, style: StrokeStyle(lineWidth: 1, lineCap: .butt, lineJoin: .miter, dash: [10]))
                        .frame(height: 1)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Title")
                                .font(.caption)
                            Text("Team Dinner")
                                .font(.title2)
                                .fontWeight(.heavy)
                        }
                        .foregroundColor(Color("bg"))
                        .frame(maxWidth: .infinity)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Total Bill")
                                .font(.caption)
                            Text("$\(Int(bill))")
                                .font(.title2)
                                .fontWeight(.heavy)
                        }
                        .foregroundColor(Color("bg"))
                        .frame(maxWidth: .infinity)
                        .padding(.top, 10)
                    }
                    
                    VStack {
                        HStack(spacing: -20) {
                            ForEach(payers) { payer in
                                Image(payer.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 45, height: 45)
                                    .padding(5)
                                    .background(payer.bgColor)
                                    .clipShape(Circle())
                            }
                        }
                        
                        Text("Spiliting with")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("bg"))
                    .cornerRadius(25)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("card").clipShape(CustomBillCardShape()).cornerRadius(25))
                .cornerRadius(25)
                .padding(.horizontal)
            
                ForEach(payers.indices) { index in
                    PriceView(payer: $payers[index], totalAmount: bill)
                }
                
                Spacer(minLength: 25)
                
                HStack {
                    
                    HStack(spacing: 0) {
                        ForEach(1...6, id: \.self) { index in
                            Image(systemName: "chevron.right")
                                .font(.system(size: 20, weight: .heavy))
                                .foregroundColor(Color.white.opacity(Double(index) * 0.06))
                        }
                    }
                    .padding(.leading, 45)
                    
                    Spacer()
                    
                    Button {
                        pay.toggle()
                    } label: {
                        Text("Confirm Split")
                            .fontWeight(.bold)
                            .foregroundColor(Color("card"))
                            .padding(.horizontal, 20)
                            .background(Color("bg"))
                            .clipShape(Capsule())
                    }

                }
                .padding()
                .background(Color.black.opacity(0.25))
                .clipShape(Capsule())
                .padding(.horizontal)
            }
        }
        .background(Color("bg").ignoresSafeArea())
        .alert(isPresented: $pay) {
            Alert(title: Text("Alert"), message: Text("Confirm split-pay"), primaryButton: .default(Text("Pay"), action: {
                //some action
            }), secondaryButton: .destructive(Text("Cancel"), action: {
                //some action
            }))
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
