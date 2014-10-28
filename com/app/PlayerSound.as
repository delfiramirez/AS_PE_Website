class PlayerSound extends Sound {
	
	function PlayerSound (target:Object) {
		super(target);
	}
	
	public function get volume ():Number {
		return this.getVolume();
	}
	
	public function set volume (volumePlayer:Number):Void {
		
		this.setVolume(volumePlayer);
	}
}