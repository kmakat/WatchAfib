//
//  SurveyTask.swift
//  WatchAfib
//
//  Created by Kemal Akat on 10/4/16.
//  Copyright © 2016 Kemal Akat. All rights reserved.
//

import ResearchKit

public var SurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    /* Instruction
     This section deals with the introduction of the survey
     */
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "Initial survey"
    instructionStep.text = "In this brief initial survey, we will ask you some basic questions about your heart and overall health."
    steps += [instructionStep]
    
    /* Enter the name
     
     */
    let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
    nameAnswerFormat.multipleLines = false
    
    let nameQuestionStepTitle = "What is your name?"
    
    let nameQuestionStep = ORKQuestionStep(identifier: "QuestionStep", title: nameQuestionStepTitle, answer: nameAnswerFormat)
    steps += [nameQuestionStep]
    
    /* What is known about the patient's history on atrial fibriallation
     */
    
    let questQuestionStepTitle = "Have been diagnosed with a heart condition named atrial fibrillation?"
    
    let textChoices = [
        ORKTextChoice(text: "Yes, I was diagnosed by my physician.", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "No, but I regular expierence an irregular heart beat.", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Unsure", value: 2 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    
    let questAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
    
    let questQuestionStep = ORKQuestionStep(identifier: "TextChoiceQuestionStep", title: questQuestionStepTitle, answer: questAnswerFormat)
    steps += [questQuestionStep]

    let colorQuestionStepTitle = "What is your favorite color?"
    
    let colorTuples = [
        (UIImage(named: "red")!, "Red"),
        (UIImage(named: "orange")!, "Orange"),
        (UIImage(named: "yellow")!, "Yellow"),
        (UIImage(named: "green")!, "Green"),
        (UIImage(named: "blue")!, "Blue"),
        (UIImage(named: "purple")!, "Purple")
    ]
    
    let imageChoices : [ORKImageChoice] = colorTuples.map {
        return ORKImageChoice(normalImage: $0.0, selectedImage: nil, text: $0.1, value: $0.1 as NSCoding & NSCopying & NSObjectProtocol)
    }
    
    let colorAnswerFormat: ORKImageChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: imageChoices)
    let colorQuestionStep = ORKQuestionStep(identifier: "ImageChoiceQuestionStep", title: colorQuestionStepTitle, answer: colorAnswerFormat)
    steps += [colorQuestionStep]
    
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Thank you!"
    summaryStep.text = "You have successfully completed the survey!"
    steps += [summaryStep]
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
}
