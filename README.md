![Swift](https://img.shields.io/badge/Swift-5.0-brightgreen)
![Swift](https://img.shields.io/badge/iOS-13.0-brightgreen)
![Swift](https://img.shields.io/badge/SwiftUI-2.0-brightgreen)

# SwiftUI - PhotoEditor
<br />
<p align="center">
  <a>
    <img src="PhotoEditor/Screenshot/01.gif" alt="action" width="300">
  </a>
</p>

PhotoEditor provides different preset to modify the import image then save to their album.

## Features

- [x] 5 Different filters to let user modify their picture.
- [x] Implement Image Picker within SwiftUI.
- [x] Configure the 'Privacy - Photo Library Usage Description' to ask the premission.



## Requirements

- iOS 13.0+
- SwiftUI

## Installation

Clone the project and run in your local workstation. 

## Usage example

Within ImageController.swift, you can define the each filter as you wish.

```swift

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
 ```

## Contact
Created by [@Hung-Chun, Tsai (Carter)](linkedin.com/in/hung-chun-carter-tsai-372584175) - feel free to contact me!

<div>

<i>Follow me around the web:</i><br>

<!-- <a target="_blank" href="https://www.linkedin.com/in/hung-chun-carter-tsai-372584175/">🇱​🇮​🇳​🇰​🇪​🇩​🇮​🇳​</a> ●
<a target="_blank" href="https://www.instagram.com/hungchun.tsai/">🇮​🇳​🇸​🇹​🇦​🇬​🇷​🇦​🇲​</a> ●
<a target="_blank" href="https://www.facebook.com/hongjun.cai.5">🇫​🇦​🇨​🇪​🇧​🇴​🇴​🇰​</a> ● -->

<a href="https://www.linkedin.com/in/hung-chun-carter-tsai-372584175/" target="_blank"><img src="https://img.shields.io/badge/LinkedIn-%230077B5.svg?&style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn"></a>
<a href="https://www.instagram.com/hungchun.tsai/" target="_blank"><img src="https://img.shields.io/badge/Instagram-%23E4405F.svg?&style=flat-square&logo=instagram&logoColor=white" alt="Instagram"></a>
<a href="https://www.facebook.com/hongjun.cai.5" target="_blank"><img src="https://img.shields.io/badge/Facebook-%231877F2.svg?&style=flat-square&logo=facebook&logoColor=white" alt="Facebook"></a>

</div>
