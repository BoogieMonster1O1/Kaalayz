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

struct ItemNavigationLink: View {
    @State var item: Item

    var body: some View {
        HStack {
            ZStack(alignment: .topTrailing) {
                AsynchronousImage(URL(string: item.logoUrl ?? ""))
                    .frame(width: 48, height: 48)
                ZStack {
                    if (item.starred) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .frame(width: 8, height: 8)
                    }
                }
                .frame(width: 8, height: 8)
            }
            VStack {
                HStack {
                    Text(item.name!)
                    Spacer()
                }
                HStack {
                    Text(DateFormatter().string(from: item.deadline!))
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            Spacer()
        }
    }
}
