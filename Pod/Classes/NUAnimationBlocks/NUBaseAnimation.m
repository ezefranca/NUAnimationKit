//
//  NUBaseAnimation.m
//  NUAnimationKit
//
//  Created by Victor Maraccini on 1/22/16.
//  Copyright © 2016 Victor Gabriel Maraccini. All rights reserved.
//

#import "NUBaseAnimation.h"

@implementation NUBaseAnimation

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.options = [[NUAnimationOptions alloc] init];
        self.type = NUAnimationTypeDefault;
    }
    return self;
}

- (instancetype)initWithType: (NUAnimationType)type
                  andOptions: (NUAnimationOptions *)options
                    andDelay: (NSTimeInterval)delay
               andAnimations: (NUSimpleAnimationBlock)animations
          andCompletionBlock: (NUCompletionBlock)completionBlock{
    NSParameterAssert(animations);
    NSParameterAssert(options);
    self = [super init];
    if (self) {
        _options = options;
        self.type = type;
        _delay = delay;
        _animationBlock = [animations copy];
        _completionBlock = [completionBlock copy];
    }
    return self;
}

- (void)setType:(NUAnimationType)type {
    _type = type;
    if (type == NUAnimationTypeSpringy) {
        self.options = [[NUSpringAnimationOptions alloc] initWithOptions:self.options];
    }
}

+ (instancetype) animationBlockWithType: (NUAnimationType)type
                             andOptions: (NUAnimationOptions *)options
                               andDelay: (NSTimeInterval)delay
                          andAnimations: (NUSimpleAnimationBlock)animations {
    return [self animationBlockWithType:type
                             andOptions:options
                               andDelay:delay
                          andAnimations:animations
                     andCompletionBlock:nil];
}

+ (instancetype) animationBlockWithType: (NUAnimationType)type
                             andOptions: (NUAnimationOptions *)options
                               andDelay: (NSTimeInterval)delay
                          andAnimations: (NUSimpleAnimationBlock)animations
                     andCompletionBlock: (NUCompletionBlock)completionBlock {
    
    NUBaseAnimation *block = [[NUBaseAnimation alloc]initWithType:type
                                                                 andOptions:options
                                                                   andDelay:delay
                                                              andAnimations:animations
                                                         andCompletionBlock:completionBlock];
    return block;
}


- (void)animationWillBegin {
    
}

@end