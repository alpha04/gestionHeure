//
//  Employe.h
//  Gestion
//
//  Created by Matthieu on 28/09/2014.
//  Copyright (c) 2014 Alpha04. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employe : NSObject
{
    NSString *nom;
    NSString *prenom;
    float actif;
}
- (void)setNilValueForKey:(NSString *)key;

@property (readwrite, copy)NSString *nom, *prenom;
@property (readwrite)float actif;
@end
