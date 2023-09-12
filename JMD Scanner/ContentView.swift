//
//  ContentView.swift
//  JMD Scanner
//
//  Created by Hrutil Patel on 9/7/22.
//

import SwiftUI
import CodeScanner
import AVFoundation

struct ContentView: View {
    
    @State var isPresentingScanner = false
    @State var scannedCode : String = "Scan new item"
    
    var scannerSheet : some View {
        
        CodeScannerView(
        
            codeTypes: [.qr, .codabar, .code128, .code39, .code39Mod43, .code93, .ean13, .ean8, .interleaved2of5, .itf14, .pdf417, .upce],
            completion: { result in
                
                if case let .success(code) = result {
                    
                  
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                    
                }
                
            }
        
        
        )
        
        
    }
    
    var body: some View {
        
        VStack(spacing: 10 )
        {
            
            Spacer()
            
            Text("Hello World !")
        
            Spacer()
            
            Text(scannedCode)
            
            Button("Scan Qr code "){
                
                self.isPresentingScanner = true
                
            }
            
            .sheet(isPresented : $isPresentingScanner){
                
                self.scannerSheet
                
            }
            
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
