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
    consentDocument.title = "WatchAfib Study Consent"
    
    let consentSectionTypes: [ORKConsentSectionType] = [
        .overview,
        .dataGathering,
        .privacy,
        .dataUse,
        .timeCommitment,
        //.studySurvey,
        //.studyTasks,
        .withdrawing
    ]
    
    
   let consentSections: [ORKConsentSection] = consentSectionTypes.map { contentSectionType in
        let consentSection = ORKConsentSection(type: contentSectionType)
        switch contentSectionType {
        case .overview:
            consentSection.summary = "Overview"
            consentSection.content = "Atrial fibrillation affects a large proportion of the US population and can cause stroke. " +
                                    "In this study we want to investigate if mobile devices can help us identify an effect on cognitive function."
        case .dataGathering:
            consentSection.summary = "Data Collection"
            consentSection.content = "If you consent to participate in this study, we will ask you to complete a survey every 4 weeks and also " +
            "to allow us to track your daily activity for 7 days using your iPhone or Apple Watch."
        case .privacy:
            consentSection.summary = "Privacy"
            consentSection.content = "Also there is the potential for data breach, we keep your data safe. TRUST US!"
        case .dataUse:
            consentSection.summary = "Data Use"
            consentSection.content = "We will use the collected data only for research purposes and not distribute it to third parties."
        case .timeCommitment:
            consentSection.summary = "Time Commitment"
            consentSection.content = "We talked about this."
        case .withdrawing:
            consentSection.summary = "Withdrawing"
            consentSection.content = "If you do not want to further participate in this study, you can withdraw any time without any consequences."
        default:
            break
        }
        return consentSection
    }
 
    consentDocument.sections = consentSections
    
    consentDocument.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature"))
    
    return consentDocument
    
}
