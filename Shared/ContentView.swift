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
import CoreData

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.deadline, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @State private var starredOnly = false

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        ItemView(item: item)
                    } label: {
                        ItemNavigationLink(item: item)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: {
                        viewModel.showNewItemScreen = true
                    }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
        .sheet(isPresented: $viewModel.showNewItemScreen){
            NewItemSheet(callback: {
                addItem(name: $0, deadline: $1, decision: $2, logoUrl: $3, earlyRound: $4)
            })
        }
        .navigationTitle("Kaalayz").toolbar{
            Spacer()
            Toggle(isOn: $starredOnly) {
                if(starredOnly){
                    Image(systemName: "star.fill")
                } else{
                    Image(systemName: "star")
                }
            }
            Button(action:{ viewModel.showNewItemScreen = true }) {
                Image(systemName: "plus")
            }
            .keyboardShortcut("n")
        }
    }

    private func addItem(name: String, deadline: Date, decision: Date, logoUrl: String, earlyRound: Bool) {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.name = name
            newItem.starred = false
            newItem.logoUrl = logoUrl
            newItem.deadline = deadline
            newItem.decision = decision
            newItem.earlyRound = earlyRound

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
