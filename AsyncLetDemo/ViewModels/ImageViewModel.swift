//
//  ImageViewModel.swift
//  AsyncLetDemo
//
//  Created by Thongchai Subsaidee on 10/5/22.
//

import SwiftUI

class ImageViewModel: ObservableObject {
    
    @Published var images: [UIImage] = []
    
    func runImage() async throws {
        Task {
            do{
        
                async let image1 = fetchImage()
                async let image2 = fetchImage()
                async let image3 = fetchImage()
                async let image4 = fetchImage()
                
                let (img1, img2, img3, img4) = await (try image1, try image2, try image3, try image4)
                self.images.append(contentsOf: [img1, img2, img3, img4])
                
//                let image1 = try await fetchImage()
//                    self.images.append(image1)
//
//                let image2 = try await fetchImage()
//                    self.images.append(image2)
//
//                let image3 = try await fetchImage()
//                    self.images.append(image3)
//
//                let image4 = try await fetchImage()
//                    self.images.append(image4)
            
                
            }catch {
                
            }
        }
    }
    
    
    func fetchImage() async throws -> UIImage {
        let urlString = "https://picsum.photos/1000"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data) {
                return image
            }else {
                throw URLError(.badURL)
            }
        }catch{
            throw error
        }
    }
    
}
