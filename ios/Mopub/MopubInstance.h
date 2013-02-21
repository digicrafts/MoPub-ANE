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


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "MPAdView.h"
#import "MPAdConversionTracker.h"
#import "GADBannerView.h"
#import "MMAdView.h"

typedef void(^MopubEventHandler)(NSString*, NSString*);

@interface MopubInstance : NSObject <MPAdViewDelegate,GADBannerViewDelegate,MMAdDelegate>{
    
    MPAdView *adView_;
    UIView *adContainerView_;
    NSString *aid_;
    MopubEventHandler eventHandler_;
}
@property (nonatomic, copy) MopubEventHandler eventHandler;

- (id) initWithAdUnitId:(NSString*)aid;
- (void) showAdViewWithFrame:(CGRect)frame;
- (void) dismissAdView;
- (void) setAdUnitId:(NSString*)aid;
- (void) loadAd;
- (void) refreshAd;



@end
