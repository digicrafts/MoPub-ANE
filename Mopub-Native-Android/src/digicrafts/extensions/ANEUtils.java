package digicrafts.extensions;

import android.app.Activity;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;

public class ANEUtils {
	
	
	  public static void positionAndResizeView(View v, Rect rect)
	  {
	    RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(v.getLayoutParams().width, v.getLayoutParams().height);
	    params.setMargins(rect.left, rect.top, 0, 0);
	    v.setLayoutParams(params);
	  }

	  public static RelativeLayout addView(Activity act, View v, Rect rect)
	  {
	    RelativeLayout rl = new RelativeLayout(act);

	    ViewGroup fl = (ViewGroup)act.findViewById(android.R.id.content);
	    fl = (ViewGroup)fl.getChildAt(0);

	    fl.addView(rl, new FrameLayout.LayoutParams(-1, -1));

	    RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(rect.width(), rect.height());
	    params.setMargins(rect.left, rect.top, 0, 0);
	    rl.addView(v, params);

	    return rl;
	  }
}
