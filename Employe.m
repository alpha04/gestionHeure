//
//  Employe.m
//  Gestion
//
//  Created by Matthieu on 28/09/2014.
//  Copyright (c) 2014 Alpha04. All rights reserved.
//

#import "Employe.h"

@implementation Employe
@synthesize nom;
@synthesize prenom;
@synthesize actif;

- (id)init
{
    self = [super init];
    if (self) {
        actif = 0;
        nom = @"Nom";
        prenom = @"Prénom";
    }
    return self;
}

- (void)setNilValueForKey:(NSString *)key
{
    if ([key isEqual:@"actif"]) {
        [self setActif:0.05];
    }else{
        [super setNilValueForKey:key];
    }
}
@end
