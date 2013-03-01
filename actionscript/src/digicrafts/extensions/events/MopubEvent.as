package digicrafts.extensions.events
{
	import flash.events.Event;
	
	public class MopubEvent extends Event
	{
        public static const AD_LOADED:String="adViewDidLoadAd";
        public static const AD_FAIL:String="adViewDidFailToLoadAd";
		public static const PRESENT_MODAL_VIEW:String="willPresentModalViewEvent";
		public static const DISMISS_MODAL_VIEW:String="didDismissModalViewEvent";
		
		public function MopubEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}