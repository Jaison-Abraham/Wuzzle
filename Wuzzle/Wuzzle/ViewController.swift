//
//  ViewController.swift
//  Wuzzle
//
//  Created by JAISON ABRAHAM on 2025-08-04.
//

import UIKit

class ViewController: UIViewController {

    //initializing
    private var targetWord = ""
    private var currentRow = 0
    private var currentCol = 0
    private var gameOver = false
    private var buttonDictionary: [String: UIButton] = [:]
    var lettersArray: [String] = []
    private let validWords = [
        "SWIFT", "APPLE", "CODER", "DREAM", "FOCUS", "LABEL", "STUDY", "TEACH",
    ]

    //For colours
    private let correctPositionColor = UIColor(
        red: 0.6, green: 0.95, blue: 0.4, alpha: 1.0)
    private let wrongPositionColor = UIColor(
        red: 1.0, green: 0.702, blue: 0.502, alpha: 1.0)
    private let wrongLetterColor = UIColor(
        red: 0.8, green: 0.16, blue: 0.16, alpha: 1.0)
    private let defaultTileColor = UIColor.systemBackground
    private let defaultBorderColor = UIColor.systemGray4.cgColor

    private var gridLabels: [[UILabel]] = []

    //For Text Boxes
    @IBOutlet weak var row1Col1: UILabel!
    @IBOutlet weak var row1Col2: UILabel!
    @IBOutlet weak var row1Col3: UILabel!
    @IBOutlet weak var row1Col4: UILabel!
    @IBOutlet weak var row1Col5: UILabel!

    @IBOutlet weak var row2Col1: UILabel!
    @IBOutlet weak var row2Col2: UILabel!
    @IBOutlet weak var row2Col3: UILabel!
    @IBOutlet weak var row2Col4: UILabel!
    @IBOutlet weak var row2Col5: UILabel!

    @IBOutlet weak var row3Col1: UILabel!
    @IBOutlet weak var row3Col2: UILabel!
    @IBOutlet weak var row3Col3: UILabel!
    @IBOutlet weak var row3Col4: UILabel!
    @IBOutlet weak var row3Col5: UILabel!

    @IBOutlet weak var row4Col1: UILabel!
    @IBOutlet weak var row4Col2: UILabel!
    @IBOutlet weak var row4Col3: UILabel!
    @IBOutlet weak var row4Col4: UILabel!
    @IBOutlet weak var row4Col5: UILabel!

    @IBOutlet weak var row5Col1: UILabel!
    @IBOutlet weak var row5Col2: UILabel!
    @IBOutlet weak var row5Col3: UILabel!
    @IBOutlet weak var row5Col4: UILabel!
    @IBOutlet weak var row5Col5: UILabel!

    //for Keybord

    @IBOutlet weak var submitButton: UIButton!

    @IBOutlet weak var buttonQ: UIButton!
    @IBAction func buttonClickedQ(_ sender: Any) {
        handleLetterInput("Q")
    }

    @IBOutlet weak var buttonW: UIButton!
    @IBAction func buttonClickedW(_ sender: Any) {
        handleLetterInput("W")
    }

    @IBOutlet weak var buttonE: UIButton!
    @IBAction func buttonClickE(_ sender: Any) {
        handleLetterInput("E")
    }

    @IBOutlet weak var buttonR: UIButton!
    @IBAction func buttonClickR(_ sender: Any) {
        handleLetterInput("R")
    }

    @IBOutlet weak var buttonT: UIButton!
    @IBAction func buttonClickT(_ sender: Any) {
        handleLetterInput("T")
    }

    @IBOutlet weak var buttonY: UIButton!
    @IBAction func buttonClickY(_ sender: Any) {
        handleLetterInput("Y")
    }

    @IBOutlet weak var buttonU: UIButton!
    @IBAction func buttonClickU(_ sender: Any) {
        handleLetterInput("U")
    }

    @IBOutlet weak var buttonI: UIButton!
    @IBAction func buttonClickI(_ sender: Any) {
        handleLetterInput("I")
    }

    @IBOutlet weak var buttonO: UIButton!
    @IBAction func buttonClickO(_ sender: Any) {
        handleLetterInput("O")
    }

    @IBOutlet weak var buttonP: UIButton!
    @IBAction func buttonClickP(_ sender: Any) {
        handleLetterInput("P")
    }

    @IBOutlet weak var buttonA: UIButton!
    @IBAction func buttonClickA(_ sender: Any) {
        handleLetterInput("A")
    }

    @IBOutlet weak var buttonS: UIButton!
    @IBAction func buttonClickS(_ sender: Any) {
        handleLetterInput("S")
    }

    @IBOutlet weak var buttonD: UIButton!
    @IBAction func buttonClickD(_ sender: Any) {
        handleLetterInput("D")
    }

    @IBOutlet weak var buttonF: UIButton!
    @IBAction func buttonClickF(_ sender: Any) {
        handleLetterInput("F")
    }

    @IBOutlet weak var buttonG: UIButton!
    @IBAction func buttonClickG(_ sender: Any) {
        handleLetterInput("G")
    }

    @IBOutlet weak var buttonH: UIButton!
    @IBAction func buttonClickH(_ sender: Any) {
        handleLetterInput("H")
    }

    @IBOutlet weak var buttonJ: UIButton!
    @IBAction func buttonClickJ(_ sender: Any) {
        handleLetterInput("J")
    }

    @IBOutlet weak var buttonK: UIButton!
    @IBAction func buttonClickK(_ sender: Any) {
        handleLetterInput("K")
    }

    @IBOutlet weak var buttonL: UIButton!
    @IBAction func buttonClickL(_ sender: Any) {
        handleLetterInput("L")
    }

    @IBOutlet weak var buttonZ: UIButton!
    @IBAction func buttonClickZ(_ sender: Any) {
        handleLetterInput("Z")
    }

    @IBOutlet weak var buttonX: UIButton!
    @IBAction func buttonClickX(_ sender: Any) {
        handleLetterInput("X")
    }

    @IBOutlet weak var buttonC: UIButton!
    @IBAction func buttonClickC(_ sender: Any) {
        handleLetterInput("C")
    }

    @IBOutlet weak var buttonV: UIButton!
    @IBAction func buttonClickV(_ sender: Any) {
        handleLetterInput("V")
    }

    @IBOutlet weak var buttonB: UIButton!
    @IBAction func buttonClickB(_ sender: Any) {
        handleLetterInput("B")
    }

    @IBOutlet weak var buttonN: UIButton!
    @IBAction func buttonClickN(_ sender: Any) {
        handleLetterInput("N")
    }

    @IBOutlet weak var buttonM: UIButton!
    @IBAction func buttonClickM(_ sender: Any) {
        handleLetterInput("M")
    }

    //backspace Button
    @IBAction func backspaceButtonPress(_ sender: Any) {
        handleBackspace()
    }

    //Submit Word

    @IBAction func submitWordButtonPress(_ sender: Any) {

        submitWord()

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buttonDictionary = [
            "Q": buttonQ, "W": buttonW, "E": buttonE, "R": buttonR,
            "T": buttonT,
            "Y": buttonY, "U": buttonU, "I": buttonI, "O": buttonO,
            "P": buttonP,
            "A": buttonA, "S": buttonS, "D": buttonD, "F": buttonF,
            "G": buttonG,
            "H": buttonH, "J": buttonJ, "K": buttonK, "L": buttonL,
            "Z": buttonZ, "X": buttonX, "C": buttonC, "V": buttonV,
            "B": buttonB,
            "N": buttonN, "M": buttonM,
        ]

        setupGame()
    }
    private func setupGame() {
        // Initialize the grid labels array
        gridLabels = [
            [row1Col1, row1Col2, row1Col3, row1Col4, row1Col5],
            [row2Col1, row2Col2, row2Col3, row2Col4, row2Col5],
            [row3Col1, row3Col2, row3Col3, row3Col4, row3Col5],
            [row4Col1, row4Col2, row4Col3, row4Col4, row4Col5],
            [row5Col1, row5Col2, row5Col3, row5Col4, row5Col5],
        ]

        currentRow = 0
        print("after setup", currentRow)
        currentCol = 0
        gameOver = false
        lettersArray = []
        for row in gridLabels {
            for label in row {
                label.layer.borderWidth = 1
                label.layer.cornerRadius = 8
                label.layer.borderColor = defaultBorderColor
                label.backgroundColor = UIColor.separator
                label.text = ""
                label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            }
        }

        for (_, button) in buttonDictionary {
            button.backgroundColor = UIColor.systemGray6
            button.layer.cornerRadius = 8
        }

        submitButton.isHidden = true
        // Randomly select a target word
        targetWord = validWords.randomElement() ?? ""
        print(targetWord)
    }

    private func handleBackspace() {

        if currentCol > 0 {
            gridLabels[currentRow][currentCol - 1].text = ""  // Clear last entered letter
            currentCol -= 1  // Move back

            print("currentcol", currentCol)
            print("from backspace", lettersArray)
            lettersArray.removeLast()
            print("from backspace", lettersArray)

        }
        if currentCol < 5 {
            submitButton.isHidden = true
        }
    }

    private func handleLetterInput(_ letter: String) {
        guard !gameOver, currentCol < 5 else { return }

        gridLabels[currentRow][currentCol].text = letter
        lettersArray.append(letter)
        print(lettersArray)
        currentCol += 1

        if currentCol == 5 {
            print("currentcol in check", currentCol)

            submitButton.isHidden = false

        }

    }

    private func submitWord() {
        print("Submit button pressed")

        currentCol = 0

        let submittedWord = lettersArray.joined()

        if validWords.contains(submittedWord) {
            print("Valid word: \(submittedWord)")

            //alert

            let alertController = UIAlertController(
                title: "Great Job!", message: "You won!", preferredStyle: .alert
            )
            if let viewController = UIApplication.shared.windows.first?
                .rootViewController
            {
                viewController.present(
                    alertController, animated: true, completion: nil)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                alertController.dismiss(animated: true, completion: nil)
            }
            setupGame()

        } else {
            print("Invalid word")

            colouringGuess(submittedWord)

            if currentRow == 5 && currentCol == 0 {
                print("Game Over!")
                printGameOver()
                gameOver = true
                setupGame()
                return

            }
            print(submittedWord, "=submittedWord")
            let alertController = UIAlertController(
                title: "Oh no!", message: "Try again!", preferredStyle: .alert)
            if let viewController = UIApplication.shared.windows.first?
                .rootViewController
            {
                viewController.present(
                    alertController, animated: true, completion: nil)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                alertController.dismiss(animated: true, completion: nil)
            }

        }

        submitButton.isHidden = true
        lettersArray = []

    }
    private func colouringGuess(_ guess: String) {  // New method to evaluate the guess and color code letters
        var targetLetters = Array(targetWord)
        var guessLetters = Array(guess)
        var letterCount = [Character: Int]()

        for letter in targetLetters {
            letterCount[letter, default: 0] += 1
        }

        for i in 0..<5 {
            if guessLetters[i] == targetLetters[i] {
                gridLabels[currentRow][i].backgroundColor = correctPositionColor
                gridLabels[currentRow][i].layer.cornerRadius = 8
                letterCount[guessLetters[i]]! -= 1
            }
        }

        for i in 0..<5 {
            if guessLetters[i] != targetLetters[i],
                let count = letterCount[guessLetters[i]], count > 0
            {
                gridLabels[currentRow][i].backgroundColor = wrongPositionColor
                gridLabels[currentRow][i].layer.cornerRadius = 8
                letterCount[guessLetters[i]]! -= 1
            } else if guessLetters[i] != targetLetters[i] {
                gridLabels[currentRow][i].backgroundColor = wrongLetterColor
                gridLabels[currentRow][i].layer.cornerRadius = 8
            }
        }

        for i in 0..<5 {
            let guessedLetter = guessLetters[i]
            let targetLetter = targetLetters[i]

            guard let button = buttonDictionary[String(guessedLetter)] else {
                print("Button for letter \(guessedLetter) not found.")
                continue
            }

            if guessedLetter == targetLetter {
                button.backgroundColor = correctPositionColor
                button.layer.cornerRadius = 5
            } else if targetLetters.contains(guessedLetter) {
                button.backgroundColor = wrongPositionColor
                button.layer.cornerRadius = 5
            } else {
                button.backgroundColor = wrongLetterColor
                button.layer.cornerRadius = 5
            }
        }

        currentRow += 1
    }
    private func printGameOver() {
        let alertController = UIAlertController(
            title: "Game Over", message: "The word was: \(targetWord)",
            preferredStyle: .alert)
        if let viewController = UIApplication.shared.windows.first?
            .rootViewController
        {
            viewController.present(
                alertController, animated: true, completion: nil)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            alertController.dismiss(animated: true, completion: nil)
        }
        setupGame()
        currentRow = 0
    }

}
