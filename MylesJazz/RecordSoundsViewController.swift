//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Julian Scharf on 16/02/2016.
//  Copyright © 2016 Julian Scharf. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    @IBOutlet weak var displayResults: UILabel!
    var audioRecorder:AVAudioRecorder!
    var recordedAudio:RecordedAudio!
    
    enum DisplayState {
        case notRecording
        case recording
    }
    
    func updateDisplay(displayState: DisplayState) {
        switch displayState {
        case .notRecording:
            recordingInProgress.isHidden = false
            recordingInProgress.text = "Tap to Record"
            stopButton.isHidden = true
        case .recording:
            recordingInProgress.text = "Recording in Progress..."
            stopButton.isHidden = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateDisplay(displayState: .notRecording)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordingInProgress: UILabel!
    
    @IBAction func recordAudio(sender: UIButton) {
            let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
            let recordingName = "my_audio.wav"
            let pathArray = [dirPath, recordingName]
            let filePath = NSURL.fileURL(withPathComponents: pathArray)
            let session = AVAudioSession.sharedInstance()
            try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
            
            audioRecorder.delegate = self
            audioRecorder.isMeteringEnabled = true
            audioRecorder.prepareToRecord()
            audioRecorder.record()
            updateDisplay(displayState: .recording)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if(flag) {
            recordedAudio = RecordedAudio(audioFilePathURL: recorder.url as NSURL, audioTitle: recorder.url.lastPathComponent)
            print(recorder.url)
            recognizeAudio(url: recorder.url)
            
        } else {
            print("Recording was not successful")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "stopRecording") {
            let playSoundsVC: PlaySoundsViewController = segue.destination as! PlaySoundsViewController
            let data = sender as! RecordedAudio
            playSoundsVC.recievedAudio = data
        }
    }
    
    @IBAction func stopRecording(sender: UIButton) {
        recordingInProgress.isHidden = true
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func recognizeAudio(url: URL) {
        let recognizer = Recognize(audioFilePath: url)
        recognizer.recognize()
    }
    
    
}
