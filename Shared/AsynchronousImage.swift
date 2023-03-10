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

import Foundation
import SwiftUI

struct AsynchronousImage: View {
    var url: URL?
    @StateObject private var wrapped: ImageWrapper = ImageWrapper()

    init(_ thing: URL?) {
        self.url = thing
        download()
    }

    private func download() {
        DispatchQueue.main.async {
            do {
                if let url = self.url {
                    wrapped.image = NSImage(data: try Data(contentsOf: url))
                }
            } catch {
                // no-op
            }
        }
    }
    
    var body: some View {
        if let nsImage = wrapped.image {
            Image(nsImage: nsImage).resizable()
        } else {
            Image(systemName: "tray.circle").resizable()
        }
    }
}

fileprivate class ImageWrapper: ObservableObject {
    var image: NSImage? = nil
}
