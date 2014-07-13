//
//  Gameplay.m
//  PeevedPenguins
//
//  Created by Parker on 7/13/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Gameplay.h"

@implementation Gameplay{
    CCPhysicsNode *_physicsNode;
    CCNode *_catapultArm;
}

//called when CCB file has completed loading
-(void)didLoadFromCCB{
    //tell scene to accept touches
    self.userInteractionEnabled = TRUE;
}

//Called on every touch in this scene
-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    [self launchPenguin];
}

-(void)launchPenguin{
    //loads the Penguin.ccb we have setup in Spritebuilder
    CCNode* penguin = [CCBReader load:@"Penguin"];
    //position the penguin at the bowl of the catapult
    penguin.position = ccpAdd(_catapultArm.position, ccp(16,50));
    
    //Add the penguin to the physicsNode of this scene(because it has physics enabled
    [_physicsNode addChild:penguin];
    
    //manually create and apply a force to launch the penguin
    CGPoint launchDirection = ccp(1,0);
    CGPoint force = ccpMult(launchDirection, 8000);
    [penguin.physicsBody applyForce:force];
}
@end
