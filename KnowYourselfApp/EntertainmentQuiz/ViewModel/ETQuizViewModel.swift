//
//  ETQuizViewModel.swift
//  KnowYourselfApp
//
//  Created by SeongKook on 6/11/24.
//

import Foundation
import Combine
import AVFoundation

class ETQuizViewModel: ObservableObject {
    
    @Published var currentQuiz: EntertainmentModel
    @Published var progress: Float = 0.0
    
    var isPlayed: Bool = false
    var correctAnswers: Int = 0
    var isQuizCompleted: Bool {
        return currentQuestionIndex >= actorData.count
        // return currentQuestionIndex >= 1
    }
    var progressBinding: Published<Float>.Publisher {
        $progress
    }
    
    private var currentQuestionIndex: Int = 0
    private var actorData: [EntertainmentModel]
    private var player: AVPlayer?
    
    init(entertainmentData: [EntertainmentModel]) {
        self.actorData = entertainmentData
        self.currentQuiz = entertainmentData.first!
        updateProgress()
    }
    
    func checkAnswer(_ answer: String) -> Bool {
        if answer == currentQuiz.answer {
            correctAnswers += 1
            return true
        }
        return false
    }
    
    func nextQuiz() {
        stopAudio()
        currentQuestionIndex += 1
        
        if !isQuizCompleted {
            currentQuiz = actorData[currentQuestionIndex]
            updateProgress()
        }
    }
    
    func playAudio() {
        guard let audioURL = currentQuiz.audio, let url = URL(string: audioURL) else { return }
        
        player = AVPlayer(url: url)
        player?.play()
        isPlayed = true
    }
    
    func stopAudio() {
        player?.pause()
        isPlayed = false
    }
    
    private func updateProgress() {
        progress = Float(currentQuestionIndex + 1) / Float(actorData.count)
    }
}

