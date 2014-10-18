import flash.filters.BlurFilter;
import mx.transitions.Tween;
import mx.transitions.easing.Strong;
import Sound2;
import com.mosesSupposes.fuse.*;

//Thanks Moses...and respect ;-)
//-------------------------------


ZigoEngine.simpleSetup (Shortcuts,PennerEasing);
ZigoEngine.register (PennerEasing,Shortcuts,FuseFMP,FuseItem);


var appScreen_txt:Text;
var appVideo_mc:MovieClip;
var appImages_mc:MovieClip;
var appMusic_mc:MovieClip;
var _square:MovieClip;

var appMVL:MovieClipLoader = new MovieClipLoader ();
var appListener:Object = new Object ();
var resizeappListener:Object = new Object ();

var totalBlur:Number = 8;
var noBlur:Number = 0;
var blurTween:Tween;
var blur:BlurFilter = new BlurFilter (totalBlur, totalBlur, 3);

var appMenu:ContextMenu = new ContextMenu ();

var appCopyright:Function;
var onMail:Function;



//Init Values

this.fondoBio_mc._visible = this.content1._visible = this.barra2_mc._visible = false;
this.fondoBio_mc._alpha = this.barra2_mc._alpha = this.appMusic_mc._alpha = this.appVideo_mc._alpha = this.appImages_mc._alpha =0;


toggleFullScreenButton.appScreen_txt.text = "appScreen complet";

Stage.scaleMode = "noScale";
Stage.align = "TL";


// Object Screen Functions

toggleFullScreen = function():Void
{

	if (Stage["displayState"] == "normal")
	{
		Stage["displayState"] = "fullScreen";
	}
	else
	{
		Stage["displayState"] = "normal";
	}
}



resizeappListener.onResize = function ():Void
{

	toggleFullScreenButton._x = 900;
	toggleFullScreenButton._y = 13;
	toggleFullScreenButton.appScreen_txt.text = "appScreen normal";
};


Stage.addListener (resizeappListener);

this.createEmptyMovieClip ("appContainer_mc",0);
this.appContainer_mc._x = 0;
this.appContainer_mc._y = 0;
appContainer_mc.filters = new Array (blur);

appListener.onLoadStart = function ()
{
	blurTween = new Tween (blur, "blurX", Strong.easeOut, blur.blurX, noBlur, 1.0, true);
	blurTween.onMotionChanged = function ()
	{
		blur.blurY = blur.blurX;
		appContainer_mc.filters = new Array (blur);
	};


	appContainer_mc._alpha = 0;
};


appListener.onLoadComplete = function ():Void
{
	onEnterFrame = function ()
	{
		appContainer_mc._alpha += 5;
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

//Contextual Menu

_level0.appMenu = appMenu;

appMenu.hideBuiltInItems ();

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


var item_ = new ContextMenuItem ("Developed by Segonquart Studio", onCopyright);
var item0 = new ContextMenuItem ("Developed by Segonquart Studio", onCopyright);
var item2 = new ContextMenuItem ("http://www.segonquart.net", onCopyright);
var item3 = new ContextMenuItem ("delfin@delfiramirez.info", onMail);


item_.separatorBefore = true;
item0.separatorBefore = true;
item1.separatorBefore = true;


appMenu.customItems = [item_, item0, item2, item3, item1];

//Motion

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
	}
}

appSquareMov = function(_square:MovieClip, targetX:Number, targetY:Number)
{
	var v3 = 7;
	var v9 = 5;
	if (Math.abs (_square._x - targetX) < 0.4 && Math.abs (_square._y - targetY) < 0.4)
	{
		_square._x = targetX;
		_square._y = targetY;
		play ();
		clearInterval (this.appSquare);
	}
	else
	{
		var v4 = (targetX - _square._x) / 5;
		if (v4 < 0)
		{
			_square._x += Math.max (-v3, v4);
		}
		else
		{
			_square._x += Math.min (v3, v4);
		}
		var v5 = (targetY - _square._y) / 5;
		if (v5 < 0)
		{
			_square._y += Math.max (-v3, v5);
		}
		else
		{
			_square._y += Math.min (v3, v5);
		}
		var v6 = v9 * (Math.min (Math.abs (v4 + v5) / 2, v3)) / v3;
		var v8 = new flash.filters.BlurFilter (v6, v6, 1);
		var v7 = new Array ();
		v7.push (v8);
		_square.filters = v7;
	}
}


// Object Prototype Fader


MovieClip.prototype.loadFade = function (app_mc:MovieClip, dest_mc:MovieClip)
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


//Start

var appContainer:MovieClip = this.createEmptyMovieClip ("appContainer_mc", this.getNextHighestDepth ());
var mcLoader:MovieClipLoader = new MovieClipLoader ();
mcLoader.addListener (this);
mcLoader.loadClip ("barra.swf",container);

onLoadInit = function(mc:MovieClip)
{
	trace ("onLoadInit: " + mc);
}

