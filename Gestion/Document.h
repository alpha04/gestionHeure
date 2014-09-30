//
//  Document.h
//  Gestion
//
//  Created by Matthieu on 28/09/2014.
//  Copyright (c) 2014 Alpha04. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument
{
    //Tableau Employés
    NSMutableArray *employes;
    
    //Calendrier
    NSDate *currentDate;
    
    //Heures journalières
    NSDate *heureMD, *heureMF, *heureAMD, *heureAMF;
    NSDate *heuresTotalMatin;
    NSDate *heuresTotalAMidi;
    NSDate *heuresTotal;
}
- (IBAction)incrementMD:(id)sender;
- (IBAction)incrementMF:(id)sender;
- (IBAction)incrementAMD:(id)sender;
- (IBAction)incrementAMF:(id)sender;

@end
