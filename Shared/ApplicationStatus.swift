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

// c-style enum
// sue me
struct ApplicationStatus {
    static let rejected: Int16 = 0
    static let ongoing : Int16 = 1
    static let applied : Int16 = 2
    static let waitlist: Int16 = 3
    static let deferred: Int16 = 4
    static let accepted: Int16 = 5
}
