//
//  BadgeRowView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/19.
//

import SwiftUI

struct BadgeRowView: View {
    
    var body: some View {
        
        HStack {
            
            Image(systemName: "heart.fill")
                .font(.system(size: 66))
            
            VStack(alignment: .leading) {
                
                Text("물먹는 하마")
                    .font(.system(size: 24, weight: .bold))
                
                Text("물먹는 하마물먹는 하마물먹는 하마물먹는 하마물먹는 하마물먹는 하마물먹는 하마물먹는 하마물먹는 하마물먹는")
                    .font(.system(size: 16, weight: .medium))
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: 114)
        .background(Color.box_color)
        .cornerRadius(10)
    }
}

struct BadgeRowView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeRowView()
    }
}
