//
//  SwiftUIView.swift
//  CustomSliders
//
//  Created by Магомед Ахильгов on 19.06.2022.
//

import SwiftUI

struct PriceView: View {
    
    @Binding var payer: Payer
    var totalAmount: CGFloat
    
    var body: some View {
        VStack(spacing: 15) {
            
            HStack {
                Image(payer.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .padding(5)
                    .background(payer.bgColor)
                    .clipShape(Circle())
                
                Text(payer.name)
                    .font(.title2.bold())
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("$" + getPrice())
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                
                Capsule()
                    .fill(Color.black.opacity(0.25))
                    .frame(height: 30)
                
                Capsule()
                    .fill(payer.bgColor)
                    .frame(width: payer.offset + 20, height: 30)
                
                HStack(spacing: (UIScreen.main.bounds.width - 100)/12) {
                    ForEach(0..<12, id: \.self) { index in
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: index % 4 == 0 ? 7 : 4, height: index % 4 == 0 ? 7 : 4)
                    }
                }
                .padding(.leading)
                
                Circle()
                    .fill(Color("card"))
                    .frame(width: 35, height: 35)
                    .background(Circle().stroke(Color.white, lineWidth: 5))
                    .offset(x: payer.offset)
                    .gesture(DragGesture().onChanged({ (value) in
                        if value.location.x >= 20 && value.location.x <= UIScreen.main.bounds.width - 50 {
                            payer.offset = value.location.x - 20
                        }
                    }))
            }
        }
        .padding()
    }
    
    func getPrice() -> String {
        let percent = payer.offset / (UIScreen.main.bounds.width - 70)
        let amount = percent * (totalAmount / 3)
        return String(format: "%.2f", amount)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
