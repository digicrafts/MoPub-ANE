/*
MoPub Native Extension for Adobe Air

Copyright (c) 2012, Digicrafts
All rights reserved.
http://www.digicrafts.com.hk/components

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

*/
package digicrafts.extensions
{

import digicrafts.extensions.events.MopubEvent;

import flash.events.EventDispatcher;
import flash.events.StatusEvent;
import flash.external.ExtensionContext;
import flash.system.Capabilities;

public class Mopub extends EventDispatcher
	{
		public static var instance:Mopub;
		private static var allowInstance:Boolean=false;
		private static var extensionContext:ExtensionContext = null;
		private static var shown:Boolean=false;
		private static var loaded:Boolean=false;
		
		public function Mopub()
		{
			if(!allowInstance){
				throw new Error("Error: Instantiation failed: Use Mopub.getInstance() instead of new.");
			}
		}
		
// Private Static Function
/////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		/**
		 * 
		 * @return 
		 * 
		 */		
		private static function getInstance():Mopub
		{
			if(instance==null){
				allowInstance=true;
//				trace("[Mopub] getInstance");
				instance=new Mopub();			
				if ( !extensionContext && Capabilities.os.indexOf("x86_64")==-1)
				{
					trace("[Mopub] Get Mopub Extension Instance...");
					extensionContext = ExtensionContext.createExtensionContext("digicrafts.extensions.Mopub","Mopub");
					extensionContext.addEventListener(StatusEvent.STATUS,instance._handleStatusEvents);
//					trace("[Mopub] Init Mopub...");
				}
				allowInstance=false;
			}
			return instance;
		}
		
// Public Static Function
/////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		/**
		 * 
		 * 
		 */		
		public static function create(aid:String):void
		{
			getInstance()._create(aid);			
		}
		/**
		 * 
		 * @param aid
		 * 
		 */		
		public static function setAID(aid:String):void
		{
			getInstance()._setAID(aid);	
		}
		/**
		 * 
		 * 
		 */		
		public static function showAdView(x:Number,y:Number,width:Number,height:Number):void
		{
			if(!shown){
				shown=true;
				// Do show Ads
				getInstance()._showAdView(x,y,width,height);
			}
		}
		/**
		 * 
		 * 
		 */		
		public static function updateAdView(x:Number,y:Number,width:Number,height:Number):void
		{			
			// Do show Ads
			getInstance()._showAdView(x,y,width,height);		
		}
		/**
		 * 
		 * 
		 */		
		public static function dismissAdView():void
		{
			if(shown){
				shown=false;
				// Do hide Ads
				getInstance()._dismissAdView();
			}
		}
		/**
		 * 
		 * 
		 */		
		public static function loadAd():void
		{
			getInstance()._loadAd();
		}
		/**
		 * 
		 * 
		 */		
		public static function refreshAd():void
		{
			getInstance()._refreshAd();
		}

		
// Private Functions
/////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		/**
		 * 
		 * 
		 */		
		protected function _create(aid:String):void
		{
//			trace(extensionContext);
            if(extensionContext)
			extensionContext.call("create",aid);
		}
		/**
		 * 
		 * @param aid
		 * 
		 */		
		protected function _setAID(aid:String):void
		{
            if(extensionContext)
			extensionContext.call("setUnitId",aid);
		}
		/**
		 * 
		 * @param x
		 * @param y
		 * @param width
		 * @param height
		 * 
		 */		
		protected function _showAdView(x:Number,y:Number,width:Number,height:Number):void
		{
            if(extensionContext)
			extensionContext.call("showAdView",x,y,width,height);
			if(!loaded) _loadAd();
		}
		/**
		 * 
		 * 
		 */		
		protected function _dismissAdView():void
		{
            if(extensionContext)
			extensionContext.call("dismissAdView");
		}
		/**
		 * 
		 * 
		 */		
		protected function _loadAd():void
		{
			loaded=true;
            if(extensionContext)
			extensionContext.call("loadAd");
		}
		/**
		 * 
		 * 
		 */		
		protected function _refreshAd():void
		{
            if(extensionContext)
			extensionContext.call("refreshAd");
		}
		
// Private Handler Functions
/////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		/**
		 * 
		 * @param e
		 * 
		 */		
		protected function _handleStatusEvents(e:StatusEvent):void
		{
			var event:MopubEvent=new MopubEvent(e.code);
			if (event != null)
			{
				this.dispatchEvent(event);				
			}
		}
		
	}
}