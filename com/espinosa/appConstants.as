var BASE_URL:String = "http://www.pereespinosa.net";
var appScreen_txt:Text;
var appappVideo_mc:MovieClip;
var appImages_mc:MovieClip;
var appMusic_mc:MovieClip;
var _square:MovieClip;
var appClipContent:MovieClip;
var appClipBar2_mc:MovieClip;
var appBackground_mc:MovieClip;
var appAuthor_mc:MovieClip;
var appAuthorBio_mc:MovieClip;
var appIntroText_mc:MovieClip;

var app_mc:MovieClip;
var dest_mc:MovieClip;

var appMVL:MovieClipLoader = new MovieClipLoader ();

// -- Private Functions --
var appListener:Object = new Object ();
var resizeappListener:Object = new Object ();

var addEventListener:Function;
var removeEventListener:Function;
var onResize:Function;
var onLoadStart:Function;
var onLoadComplete:Function;



var totalBlur:Number = 8;
var noBlur:Number = 0;
var blurTween:Tween;
var blur:BlurFilter = new BlurFilter (totalBlur, totalBlur, 3);

var appMenu:ContextMenu = new ContextMenu ();

var appCopyright:Function;
var onMail:Function;

var moveSquare:Function;
var appSquareMov:Function;


var speed:Number = 9;
var i:Number = 0;

var appBang_mc:MovieClip;
var appBar_mc:MovieClip;
var appBlog_mc:MovieClip;
var appAuthorBio_mc:MovieClip;
var appBackgroundBio_mc:MovieClip;
var appBackgroundVideo_mc:MovieClip;
var appCredits_mc:MovieClip;
var appContact_mc:MovieClip;
var appIntroText_mc:MovieClip;
var appEvent2009_mc:MovieClip;
var appMultimedia_mc:MovieClip;
var appPlayer_mc:MovieClip,
var appStick:MovieClip;
var appNews_mc:MovieClip;

var appPrivacy_mc:MovieClip;
var appTop_mc:MovieClip;

var contact_txt:TextField;
var policy_txt:TextField;
var credits_txt:TextField;

var appStart:Function;

// -- Getters and Setters --

var appMCRelease:Function;
var hideappEvent2009:Function;
var hideIntroText:Function;
var hideappMediaParent:Function;
var showappMediaParent:Function;
var unloadAppMediaParent:Function;
var hideappBackgroundColoured:Function;
var hideMovieclipSquare:Function;

var applicationFiles_array:Array = new Array("appAuthorBio.swf","appURL.swf","appMusic.swf","appMultimedia.swf","appCredits.swf","appPrivacy.swf");
