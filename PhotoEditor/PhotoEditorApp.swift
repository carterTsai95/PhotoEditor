//
//  PhotoEditorApp.swift
//  PhotoEditor
//
//  Created by Hung-Chun Tsai on 2021-03-12.
//

import SwiftUI

@main
struct PhotoEditorApp: App {
    
    @StateObject var imageController = ImageController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(imageController)
        }
    }
}
