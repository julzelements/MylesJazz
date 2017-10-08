import UIKit

class Recognize: NSObject {
    
    var audioURL: URL
    
    init(audioFilePath: URL) {
        self.audioURL = audioFilePath
    }
    
    func recognize() {
        print("recognize was reached")
        print(audioURL)
        let recordingName = audioURL.lastPathComponent
        print(recordingName)
        let data = try! Data(contentsOf: audioURL)
        let url = URL(string: "http://192.168.1.105:5000/recognize")!
        
        let boundary = "Boundary-\(UUID().uuidString)"
        
        let body = createMultipart(data: data, boundary: boundary, fileName: recordingName)
        print(body)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.setValue("100-continue", forHTTPHeaderField: "Expect")
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request) { (data,
            response, error) in
            if let data = data,
                let string = String(data: data, encoding: .utf8) {
                print(string)
            }
        }
        
        task.resume()
    }
    
    private func createMultipart(data: Data, boundary: String, fileName: String) -> Data {
        var body = Data()
        
        let boundaryPrefix = "--\(boundary)\r\n"
        body.append(contentsOf: boundaryPrefix.utf8)
        body.append(contentsOf: "Content-Disposition: form-data; name=\"file\"; filename=\"my_audio.wav\"\r\n".utf8)
        body.append(contentsOf: "Content-Type: audio/wav\r\n".utf8)
        body.append(contentsOf: "\r\n".utf8)
        body.append(data)
        body.append(contentsOf: "\r\n".utf8)
        body.append(contentsOf: ("--" + boundary + "--").utf8)
        body.append(contentsOf: "\r\n".utf8)
        return body
    }
    
    private func createRequest(){
        
    }
}
