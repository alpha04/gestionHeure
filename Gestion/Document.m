//
//  Document.m
//  Gestion
//
//  Created by Matthieu on 28/09/2014.
//  Copyright (c) 2014 Alpha04. All rights reserved.
//

#import "Document.h"

@implementation Document

- (id)init
{
    self = [super init];
    if (self) {
        //Init Tableau Enmployés
        employes = [[NSMutableArray alloc]init];
        
        // Init Date
        [self setValue:[NSDate date] forKey:@"currentDate"];
        NSDate *a = [self valueForKey:@"currentDate"];
        NSLog(@"Init date : %@",a);
        
        //Init Heures
        NSDate *initHeure = [NSDate dateWithNaturalLanguageString:@"00:00"];
        NSLog(@"Init heure : %@",initHeure);
        [self setValue:initHeure forKey:@"heureMD"];
        [self setValue:initHeure forKey:@"heureMF"];
        [self setValue:initHeure forKey:@"heureAMD"];
        [self setValue:initHeure forKey:@"heureAMF"];
        
        //Init Calcul
        NSDate *initCalculHeure = [NSDate dateWithNaturalLanguageString:@"00:00"];
        NSLog(@"Init calcul heure : %@",initCalculHeure);
        [self setValue:initCalculHeure forKey:@"heuresTotalMatin"];
        NSDate *initCalculHeureAM = [NSDate dateWithNaturalLanguageString:@"00:00"];
        NSLog(@"Init calcul heure : %@",initCalculHeureAM);
        [self setValue:initCalculHeureAM forKey:@"heuresTotalAMidi"];
    }
    return self;
}

#pragma mark - OS

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    NSException *exception = [NSException exceptionWithName:@"UnimplementedMethod" reason:[NSString stringWithFormat:@"%@ is unimplemented", NSStringFromSelector(_cmd)] userInfo:nil];
    @throw exception;
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    NSException *exception = [NSException exceptionWithName:@"UnimplementedMethod" reason:[NSString stringWithFormat:@"%@ is unimplemented", NSStringFromSelector(_cmd)] userInfo:nil];
    @throw exception;
    return YES;
}

#pragma mark - Fonction heures

- (NSDate *)heuresTotalMatin
{
    NSLog(@"Init calcul des heures");
    return heuresTotalMatin;
}

- (void)setHeuresTotalMatin
{
    [self willChangeValueForKey:@"heuresTotalMatin"];
    NSString *s;
    if (heureMD >= heureMF) {
        heuresTotalMatin = [NSDate dateWithNaturalLanguageString:@"00:00"];
    }
    else
    {
        NSDate *startDate = heureMD;
        NSDate *endDate = heureMF;
        NSCalendar *gregorian = [[NSCalendar alloc]
                                 initWithCalendarIdentifier:NSGregorianCalendar];
        NSUInteger unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit;
        NSDateComponents *components = [gregorian components:unitFlags
                                                    fromDate:startDate
                                                      toDate:endDate options:0];
        NSInteger hours = [components hour];
        NSInteger minutes = [components minute];
        
        if (hours<10 && minutes>9) {
            s = [NSString stringWithFormat:@"0%ld:%ld", hours, minutes];
        }
        else if (hours>9 && minutes<10)
        {
            s = [NSString stringWithFormat:@"%ld:0%ld", hours, minutes];
        }
        else if (hours<10 && minutes<10)
        {
            s = [NSString stringWithFormat:@"0%ld:0%ld", hours, minutes];
        }
        else{
            s = [NSString stringWithFormat:@"%ld:%ld", hours, minutes];
        }
        
        NSLog(@"%@",s);
    }
    
    heuresTotalMatin = [NSDate dateWithNaturalLanguageString:s];
    NSLog(@"%@",heuresTotalMatin);
    [self setHeuresTotal];
    [self didChangeValueForKey:@"heuresTotalMatin"];
}

- (NSDate *)heuresTotalAMidi
{
    NSLog(@"Init calcul des heures");
    return heuresTotalAMidi;
}

- (void)setHeuresTotalAMidi
{
    [self willChangeValueForKey:@"heuresTotalAMidi"];
    NSString *s;
    if (heureAMD >= heureAMF) {
        heuresTotalAMidi = [NSDate dateWithNaturalLanguageString:@"00:00"];
    }
    else
    {
        NSDate *startDate = heureAMD;
        NSDate *endDate = heureAMF;
        NSCalendar *gregorian = [[NSCalendar alloc]
                                 initWithCalendarIdentifier:NSGregorianCalendar];
        NSUInteger unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit;
        NSDateComponents *components = [gregorian components:unitFlags
                                                    fromDate:startDate
                                                      toDate:endDate options:0];
        NSInteger hours = [components hour];
        NSInteger minutes = [components minute];
        
        if (hours<10 && minutes>9) {
            s = [NSString stringWithFormat:@"0%ld:%ld", hours, minutes];
        }
        else if (hours>9 && minutes<10)
        {
            s = [NSString stringWithFormat:@"%ld:0%ld", hours, minutes];
        }
        else if (hours<10 && minutes<10)
        {
            s = [NSString stringWithFormat:@"0%ld:0%ld", hours, minutes];
        }
        else{
            s = [NSString stringWithFormat:@"%ld:%ld", hours, minutes];
        }
        
        NSLog(@"%@",s);
    }
    
    heuresTotalAMidi = [NSDate dateWithNaturalLanguageString:s];
    NSLog(@"%@",heuresTotalAMidi);
    [self setHeuresTotal];
    [self didChangeValueForKey:@"heuresTotalAMidi"];
}

- (NSDate *)heuresTotal
{
    return heuresTotal;
}

- (void)setHeuresTotal
{
    [self willChangeValueForKey:@"heuresTotal"];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dc = [gregorian components: NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:heuresTotalMatin];
    
    heuresTotal = [gregorian dateByAddingComponents:dc toDate:heuresTotalAMidi options:0];
    [self didChangeValueForKey:@"heuresTotal"];
}


- (IBAction)incrementMD:(id)sender {
    [self willChangeValueForKey:@"heureMD"];
    NSLog(@"Heure Matin Début = %@", heureMD);
    [self setHeuresTotalMatin];
    [self didChangeValueForKey:@"heureMD"];
}

- (IBAction)incrementMF:(id)sender {
    [self willChangeValueForKey:@"heureMF"];
    NSLog(@"Heure Matin Fin = %@", heureMF);
    [self setHeuresTotalMatin];
    [self didChangeValueForKey:@"heureMF"];
}

- (IBAction)incrementAMD:(id)sender {
    [self willChangeValueForKey:@"heureAMD"];
    NSLog(@"Heure Après-midi Début = %@", heureAMD);
    [self setHeuresTotalAMidi];
    [self didChangeValueForKey:@"heureAMD"];
}

- (IBAction)incrementAMF:(id)sender {
    [self willChangeValueForKey:@"heureAMF"];
    NSLog(@"Heure Après-midi Fin = %@", heureAMF);
    [self setHeuresTotalAMidi];
    [self didChangeValueForKey:@"heureAMF"];
}

#pragma mark - Enregistrement

- (IBAction)enregistrer:(id)sender {
    
}
@end
