//
//  ImageController.swift
//  Photo Editor
//
//  Created by Andreas Schultz on 06.09.20.
//

import SwiftUI

class ImageController: ObservableObject {
    
    @Published var unprocessedImage: UIImage? {
        didSet {
            displayedImage = unprocessedImage
        }
    }
    
    @Published var displayedImage: UIImage?
    
    func generateFilteredImage(inputImage: UIImage?, filter: FilterType) -> UIImage? {
        
        let context = CIContext(options: nil)
        
        guard let imageToEdit = CIImage(image: inputImage!) else {
            return nil
        }
        
        switch filter {
        case .Original:
            return unprocessedImage
        case .Sepia:
            let filter = CIFilter(name: "CISepiaTone")
            filter?.setValue(imageToEdit, forKey: "inputImage")
            
            if let output = filter?.outputImage {
                if let cgimg = context.createCGImage(output, from: output.extent) {
                    let processedImage = UIImage(cgImage: cgimg)
                    return processedImage
                }
            }
        case .Mono:
            let filter = CIFilter(name: "CIPhotoEffectMono")
            filter?.setValue(imageToEdit, forKey: "inputImage")
            
            if let output = filter?.outputImage {
                if let cgimg = context.createCGImage(output, from: output.extent) {
                    let processedImage = UIImage(cgImage: cgimg)
                    return processedImage
                }
            }
        case .Vibrance:
            let filter = CIFilter(name: "CIVibrance")
            filter?.setValue(imageToEdit, forKey: "inputImage")
            filter?.setValue(20, forKey: "inputAmount")
        
            if let output = filter?.outputImage {
                if let cgimg = context.createCGImage(output, from: output.extent) {
                    let processedImage = UIImage(cgImage: cgimg)
                    return processedImage
                }
            }
        case .Highlight:
            let filter = CIFilter(name: "CIHighlightShadowAdjust")
            filter?.setValue(imageToEdit, forKey: "inputImage")
            filter?.setValue(1.4, forKey: "inputHighlightAmount")
            filter?.setValue(3.0, forKey: "inputShadowAmount")

            if let output = filter?.outputImage {
                if let cgimg =  context.createCGImage(output, from: output.extent) {
                    let processedImage = UIImage(cgImage: cgimg)
                    return processedImage
                }
            }
        case .Vignette:
            let filter = CIFilter(name: "CIVignette")
            filter?.setValue(imageToEdit, forKey: "inputImage")
            filter?.setValue(1.0, forKey: "inputRadius")
            filter?.setValue(3.0, forKey: "inputIntensity")

            if let output = filter?.outputImage {
                if let cgimg =  context.createCGImage(output, from: output.extent) {
                    let processedImage = UIImage(cgImage: cgimg)
                    return processedImage
                }
            }
        }
        
        return inputImage
    }
    
    func saveImage() {
        if let imageToSave = displayedImage {
            UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil, nil)
        } else {
            print("There is no image to be saved")
        }
    }
    
}
