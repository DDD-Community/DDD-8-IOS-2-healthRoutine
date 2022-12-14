//
//  CustomNavigationLink.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/14.
//

import SwiftUI

struct CustomNavigationLink<Label: View, Destination: View>: View {
    
    let destination: Destination
    let label: Label
    
    init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        
        NavigationLink(
            destination: CustomNavigationBarContainerView(content: {
                destination
            })
            .navigationBarHidden(true)
        ) { label }
    }
}

struct CustomNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationLink(destination: Text("Destination")) {
            Text("Click Me")
        }
    }
}
