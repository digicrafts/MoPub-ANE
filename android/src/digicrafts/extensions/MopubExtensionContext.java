package digicrafts.extensions;

import android.app.Activity;
import android.graphics.Rect;
import android.widget.RelativeLayout;
import android.widget.ImageView;


import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;

import java.util.HashMap;
import java.util.Map;

import com.mopub.mobileads.MoPubView;

public class MopubExtensionContext extends FREContext {

//	private static final String TAG = MopubExtensionContext.class.getName();
	
	private MoPubView _adView;
	private ImageView _loadingView;
	private String _unitId;
	private Rect _bannerRect;
	private RelativeLayout _adHolder;
	
	@Override
	public void dispose() {
	    if (this._adHolder != null)
	    {
	      this._adHolder.removeAllViews();
	    }
		if(_adView!=null){
			_adView.destroy();
		}
		if(_loadingView!=null){
			
		}
		_loadingView=null;
		_adHolder=null;
		_adView=null;
	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		
		Map<String, FREFunction> functionMap = new HashMap<String, FREFunction>();
	    
		functionMap.put("create", new MopubCreateFunction());
	    functionMap.put("setUnitId", new MopubSetUnitIdFunction());
	    functionMap.put("showAdView", new MopubShowAdViewFunction());
	    functionMap.put("dismissAdView", new MopubDismissAdViewFunction());
	    functionMap.put("removeAd", new MopubRemoveAdFunction());
	    functionMap.put("loadAd", new MopubLoadAdFunction());
	    functionMap.put("refreshAd", new MopubRefreshAdFunction());
	    
		return functionMap;
	}
	

	public void createAd(Activity act) {
		
		// Check if Ads Created
		if(this._adView==null){
			//Create new MoPubView
			this._adView=new MoPubView(act);
			// Add Listener
			this._adView.setOnAdLoadedListener(new MoPubView.OnAdLoadedListener() {
			    public void OnAdLoaded(MoPubView m) {
	//		        Toast.makeText(m.getActivity().getApplicationContext(), "Ad loaded!!!", Toast.LENGTH_LONG).show();
			    }
			});
			this._adView.setOnAdFailedListener(new MoPubView.OnAdFailedListener() {	
				@Override
				public void OnAdFailed(MoPubView m) {
	//				String s = "AD failL" + m.getAdWidth() + ", " + m.getAdHeight(); 
	//				Toast.makeText(m.getActivity().getApplicationContext(), s, Toast.LENGTH_LONG).show();
				}
			});
		}
	  }

	  public void dismissAd() {
	    this._adView = null;
	    if (this._adHolder != null)
	    {
	      this._adHolder.removeAllViews();
	      this._adHolder = null;
	    }
	  }

	  public MoPubView getAdView() {
	    return this._adView;
	  }

	  public void loadAd() {
		  this._adView.loadAd();
	  }
	  
	  public void refreshAd() {
		  this._adView.loadAd();
	  }
	  
	  public void saveUnitId(String _unitId) {
	    this._unitId = _unitId;
	  }

	  public String getUnitId() {
	    return this._unitId;
	  }
	  
	  public void setBannerRect(Rect _bannerRect) {
	    this._bannerRect = _bannerRect;
	  }

	  public Rect getBannerRect() {
	    return this._bannerRect;
	  }

	  public void setAdHolder(RelativeLayout _adHolder) {
	    this._adHolder = _adHolder;
	  }

	  public RelativeLayout getAdHolder() {
	    return this._adHolder;
	  }

	  public void setLoadingView(ImageView _view) {
	    this._loadingView = _view;
	  }

	  public ImageView getLoadingView() {
	    return this._loadingView;
	  }
}
