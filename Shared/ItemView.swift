//
// Copyright © 2022 Shrish Deshpande
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see &lt;http://www.gnu.org/licenses/&gt;.
//

import SwiftUI

struct ItemView: View {
    @State var item: Item
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Text(item.name!)
                        .font(.largeTitle)
                    if item.starred {
                        Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                            .onTapGesture {
                                item.starred = false
                            }
                            .frame(width: 16, height: 16)
                    } else {
                        Image(systemName: "star")
                            .resizable()
                            .foregroundColor(.gray)
                            .onTapGesture {
                                item.starred = true
                            }
                            .frame(width: 16, height: 16)
                    }
                    Spacer()
                }
                HStack {
                    DatePicker("Deadline", selection: Binding(get: {
                        return item.deadline!
                    }, set: {
                        item.deadline = $0
                    }), displayedComponents: [.date])
                    Spacer()
                }.padding()
                HStack {
                    DatePicker("Decision", selection: Binding(get: {
                        return item.deadline!
                    }, set: {
                        item.deadline = $0
                    }), displayedComponents: [.date])
                    Spacer()
                }.padding()
//                HStack {
//                    if instance.description != nil {
//                        Text(instance.description!)
//                            .font(.body)
//                    }
//                    Spacer()
//                }
                Spacer()
            }
            .padding(.all, 6)
        }
    }
}
