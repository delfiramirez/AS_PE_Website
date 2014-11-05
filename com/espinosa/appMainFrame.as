
import mx.data.binding.ObjectDumper;
import flash.filters.BlurFilter;
import mx.transitions.Tween;
import mx.transitions.easing.Strong;
import com.espinosa.appConstants;
import com.segonquart.Sonido;
import com.mosesSupposes.fuse.*;



// -- Thanks Moses...and respect ;-) --

var appTimeline:MovieClip = this;

if ( typeof (appTimeline) == "movieclip" && this._currentframe =  "appMainFrame")
{

ZigoEngine.simpleSetup (Shortcuts,PennerEasing);
ZigoEngine.register (PennerEasing,Shortcuts,FuseFMP,FuseItem);



// -- Init Values--


toggleFullScreenButton.appScreen_txt.text = "appScreen complet";

Stage.scaleMode = "noScale";
Stage.align = "TL";


// -- Object Screen Functions --

toggleFullScreen = function():Void
{

	if (Stage["displayState"] == "normal")
	{
		Stage["displayState"] = "fullScreen";
	}
	else
	{
		Stage["displayState"] = "normal";
	};
};

resizeappListener.onResize = function ():Void
{

	toggleFullScreenButton._x = 900;
	toggleFullScreenButton._y = 13;
	toggleFullScreenButton.appScreen_txt.text = "appScreen normal";

};

Stage.addListener (resizeappListener);

// --- Public Methods : Load Effects and Motion

if (file_exists(urlAssetsClipBar)) 
{
var urlAppString = urlAssetsClipBar;
}

this.createEmptyMovieClip ("appContainer_mc",0);

appContainer_mc.filters = new Array (blur);

appListener.onLoadInit = function(appContainer_mc:MovieClip):Void
{

	this.appContainer_mc._x = 0;
	this.appContainer_mc._y = 0;

	this.appBackground_mc._visible = this.appClipContent._visible = this.appClipBar2_mc._visible = false;
	this.appBackgroundo_mc._alpha = this.appClipBar2_mc._alpha = this.appMusic_mc._alpha = this.appappVideo_mc._alpha = this.appImages_mc._alpha =0;

};

appListener.onLoadError = function(appContainer_mc:MovieClip, errorCode:String, httpStatus:Number):Void
{

    trace("errorCode: " + errorCode);
    trace("httpStatus: " + httpStatus);
	
};

appListener.onLoadStart = function ():Void
{
	blurTween = new Tween (blur, "blurX", Strong.easeOut, blur.blurX, noBlur, 1.0, true);
	
	blurTween.onMotionChanged = function ():Void
	{
		blur.blurY = blur.blurX;
		appContainer_mc.filters = new Array (blur);
	};

	this.appBackground_mc._visible = this.appClipContent._visible = this.appClipBar2_mc._visible = true;
	
	appContainer_mc._alpha = 0;
};

appListener.onLoadComplete = function (appContainer_mc:MovieClip):Void
{
	onEnterFrame = function ():Void
	{
		appContainer_mc._alpha += 5;
		
		trace(ObjectDumper.toString(_global));
		
		if (appContainer_mc._alpha >= 100)
		{
			delete this.onEnterFrame;
		}
		
		blurTween = new Tween (blur, "blurX", Strong.easeOut, blur.blurX, totalBlur, 1.0, true);
		
		blurTween.onMotionChanged = function ()
		{
			blur.blurY = blur.blurX;
			dest_mc.filters = new Array (blur);
		};
	};
};

appMVL.addListener (appListener);

var appContainer_mc:MovieClip = this.createEmptyMovieClip ("aContainer_mc", this.getNextHighestDepth ());

var mcLoader:MovieClipLoader = new MovieClipLoader ();

mcLoader.addListener (appListener);

mcLoader.loadClip (urlAppString , aContainer_mc);

// -- Private Method Custom Contextual Menu --

_level0.appMenu = appMenu;

appMenu.hideBuiltInItems ();

var item:ContextMenuItem_ = new ContextMenuItem ("Developed by Segonquart Studio 2008", onCopyright);
var item0:ContextMenuItem = new ContextMenuItem ("Developed by Segonquart Studio 2008", onCopyright);
var item2:ContextMenuItem = new ContextMenuItem ("http://www.segonquart.net", onCopyright);
var item3:ContextMenuItem = new ContextMenuItem ("delfin@segonquart.net", onMail);

item_.separatorBefore = true;
item0.separatorBefore = true;
item1.separatorBefore = true;

appMenu.customItems = [item_, item0, item2, item3, item1];

onCopyright = function ():Void
{

	trace ("onCopyright(" + arguments + ")");
	getURL ("http://segonquart.net", "_blank");

};

onMail = function ():Void
{

	trace ("onCopyright(" + arguments + ")");
	getURL ("mailto:Segonquart Studio <2qt@segonquart.net>");

};

// -- Private Method : Object SQUARE Motion --

moveSquare = function(targetX:Number, targetY:Number)
{
	if (targetX != square._x && targetY != square._y)
	{
		square._x = targetX;
		square._y = targetY;
		play ();
	}
	else
	{
		this.appSquare = setInterval (appSquareMov, 30, square, targetX, targetY);
	};
};

appSquareMov = function(_square:MovieClip, targetX:Number, targetY:Number)
{
	var v3:Number = 7;
	var v9:Number  = 5;
	if (Math.abs (_square._x - targetX) < 0.4 && Math.abs (_square._y - targetY) < 0.4)
	{
		_square._x = targetX;
		_square._y = targetY;
		play ();
		clearInterval (this.appSquare);
	}
	else
	{
		var v4:Number = (targetX - _square._x) / 5;
		
		if (v4 < 0)
		{
			_square._x += Math.max (-v3, v4);
		}
		else
		{
			_square._x += Math.min (v3, v4);
		}
		
		var v5:Number = (targetY - _square._y) / 5;
		
		if (v5 < 0)
		{
			_square._y += Math.max (-v3, v5);
		}
		else
		{
			_square._y += Math.min (v3, v5);
		}
		
		var v6:Number = v9 * (Math.min (Math.abs (v4 + v5) / 2, v3)) / v3;
		var v8:Number = new flash.filters.BlurFilter (v6, v6, 1);
		var v7:Number = new Array ();
		v7.push (v8);
		_square.filters = v7;
	};
};

// -- Private Method : Object Prototype Fader --

	MovieClip.prototype.loadFade = function (app_mc:MovieClip, dest_mc:MovieClip):Void
	{
		dest_mc._alpha = 100;
		onEnterFrame = function ()
		{
		dest_mc._alpha -= 10;
		if (dest_mc._alpha <= 0)
			{
			delete this.onEnterFrame;
			_root.appMVL.loadClip (app_mc,dest_mc);
			}
		};
	};
};
