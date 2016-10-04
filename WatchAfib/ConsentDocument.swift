//
//  ConsentDocument.swift
//  WatchAfib
//
//  Created by Kemal Akat on 10/4/16.
//  Copyright © 2016 Kemal Akat. All rights reserved.
//

import ResearchKit

public var ConsentDocument: ORKConsentDocument {
    
    let consentDocument = ORKConsentDocument()
    consentDocument.title = "CHALK Study Consent"
    
    let consentSectionTypes: [ORKConsentSectionType] = [
        .overview,
        .dataGathering,
        .privacy,
        .dataUse,
        .timeCommitment,
        .studySurvey,
        .studyTasks,
        .withdrawing
    ]
    
    let consentSections: [ORKConsentSection] = consentSectionTypes.map { contentSectionType in
        let consentSection = ORKConsentSection(type: contentSectionType)
        consentSection.summary = "Welcome! If you wish to participate in this study please read" + " " +
        "the following information about elegibility and tasks in this study."
        consentSection.content = "In this study we are investigating the potential of mobile devices" + " " +
            "like smartphones and smart watches to improve the health and well being of patients with aortic" + " " +
        "valve disease."
        return consentSection
    }
    
    consentDocument.sections = consentSections
    
    consentDocument.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature"))
    
    return consentDocument
    
}
