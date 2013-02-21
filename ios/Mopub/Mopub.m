/*
 
 Copyright (c) 2012, Digicrafts
 All rights reserved.
 www.digicrafts.com.hk
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 1. Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
 The views and conclusions contained in the software and documentation are those
 of the authors and should not be interpreted as representing official policies,
 either expressed or implied, of the FreeBSD Project.
 
 
 Created by Tsang Wai Lam on 7/9/12.
 
 */


#import "Mopub.h"

MopubInstance *mopubInstance_;

/* MopubExtInitializer()
 * The extension initializer is called the first time the ActionScript side of the extension
 * calls ExtensionContext.createExtensionContext() for any context.
 *
 * Please note: this should be same as the <initializer> specified in the extension.xml 
 */
void MopubExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet) 
{
    NSLog(@"Entering MopubExtInitializer()");

    *extDataToSet = NULL;
    *ctxInitializerToSet = &MopubSuperContextInitializer;
    *ctxFinalizerToSet = &MopubSuperContextFinalizer;        

    NSLog(@"Exiting MopubExtInitializer()");
}

/* MopubExtFinalizer()
 * The extension finalizer is called when the runtime unloads the extension. However, it may not always called.
 *
 * Please note: this should be same as the <finalizer> specified in the extension.xml 
 */
void MopubExtFinalizer(void* extData) 
{
    NSLog(@"Entering MopubExtFinalizer()");

    // Nothing to clean up.
    NSLog(@"Exiting MopubExtFinalizer()");
    return;
}

/* ContextInitializer()
 * The context initializer is called when the runtime creates the extension context instance.
 */
void MopubSuperContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet)
{
    NSLog(@"Entering ContextInitializer()");
    
    /* The following code describes the functions that are exposed by this native extension to the ActionScript code.
     */
    static FRENamedFunction func[] = 
    {
        MAP_FUNCTION(isSupported, NULL),
        MAP_FUNCTION(create, NULL),
        MAP_FUNCTION(showAdView, NULL),
        MAP_FUNCTION(dismissAdView, NULL),
        MAP_FUNCTION(setAdUnitId, NULL),
        MAP_FUNCTION(loadAd, NULL),
        MAP_FUNCTION(refreshAd, NULL),
    };
    
    *numFunctionsToTest = sizeof(func) / sizeof(FRENamedFunction);
    *functionsToSet = func;
    
    NSLog(@"Exiting ContextInitializer()");
}

/* ContextFinalizer()
 * The context finalizer is called when the extension's ActionScript code
 * calls the ExtensionContext instance's dispose() method.
 * If the AIR runtime garbage collector disposes of the ExtensionContext instance, the runtime also calls ContextFinalizer().
 */
void MopubSuperContextFinalizer(FREContext ctx) 
{
    NSLog(@"Entering ContextFinalizer()");

    // Nothing to clean up.
    NSLog(@"Exiting ContextFinalizer()");
    return;
}

void dispatchStatusEvent(FREContext ctx, NSString *eventType, NSString *eventLevel) {

    if (ctx == NULL) {
        return;
    }
    const uint8_t* levelCode = (const uint8_t*) [eventLevel UTF8String];
    const uint8_t* eventCode = (const uint8_t*) [eventType UTF8String];
    FREDispatchStatusEventAsync(ctx,eventCode,levelCode);
}


/* This is a TEST function that is being included as part of this template.
 *
 * Users of this template are expected to change this and add similar functions
 * to be able to call the native functions in the ANE from their ActionScript code
 */
ANE_FUNCTION(isSupported)
{
    NSLog(@"Entering IsSupported()");
    
    FREObject fo;
    
    FREResult aResult = FRENewObjectFromBool(YES, &fo);
    if (aResult == FRE_OK)
    {
        NSLog(@"Result = %d", aResult);
    }
    else
    {
        NSLog(@"Result = %d", aResult);
    }
    
	NSLog(@"Exiting IsSupported()");    
	return nil;
}

ANE_FUNCTION(create)
{
    uint32_t length = 0;
    const uint8_t *aidString = NULL;
    FREGetObjectAsUTF8( argv[0], &length, &aidString);
    
    if(mopubInstance_==nil){
        mopubInstance_ = [[MopubInstance alloc] initWithAdUnitId:[NSString stringWithUTF8String:(char *)aidString]];
        
        // Create Event Handler block
        MopubEventHandler handler=^(NSString *eventType, NSString *eventLevel){
            dispatchStatusEvent(ctx, eventType, eventLevel);
        };
        // Assign Handler
        mopubInstance_.eventHandler=handler;
    } else {
        NSLog(@"Mopub already initied");
    }
    
	return nil;
}

ANE_FUNCTION(showAdView)
{
    if(mopubInstance_) {
        
        double x,y,w,h;
        FREGetObjectAsDouble(argv[0], &x);
        FREGetObjectAsDouble(argv[1], &y);
        FREGetObjectAsDouble(argv[2], &w);
        FREGetObjectAsDouble(argv[3], &h);
        
        CGRect f=CGRectMake(x, y, w, h);
        
        [mopubInstance_ showAdViewWithFrame:f];
    }
    
	return nil;
}

ANE_FUNCTION(dismissAdView)
{
    if(mopubInstance_)
        [mopubInstance_ dismissAdView];
    
    return nil;
}

ANE_FUNCTION(setAdUnitId)
{
    if(mopubInstance_) {
        uint32_t length = 0;
        const uint8_t *aidString = NULL;
        FREGetObjectAsUTF8( argv[0], &length, &aidString);
        [mopubInstance_ setAdUnitId:[NSString stringWithUTF8String:(char *)aidString]];
    }
    return nil;
}

ANE_FUNCTION(loadAd)
{
    if(mopubInstance_)
        [mopubInstance_ loadAd];
    
    return nil;
}

ANE_FUNCTION(refreshAd)
{
    if(mopubInstance_)
        [mopubInstance_ refreshAd];
    
    return nil;
}

