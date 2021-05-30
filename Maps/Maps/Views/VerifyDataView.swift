//
//  VerifyDataView.swift
//  Maps
//
//  Created by Ronald Joubert on 5/29/21.
//

import SwiftUI

struct VerifyDataView: View {
    
    @State private var locations = [Location]()
    @State private var text: String = "https://raw,githubusercontent.com/simonsickle/pfj-locations/master/locations.json"
    
    var body: some View {
        List(locations, id: \.id) { item in
            
            VStack {
                Text(item.name)
                Text(item.lat)
                Text(item.long)
            }
        }
    }
}

struct VerifyDataView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyDataView()
    }
}
