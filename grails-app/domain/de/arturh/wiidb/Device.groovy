package de.arturh.wiidb

class Device {
	def belongsTo = Game
    
	static hasMany = [
      // many-to-many
      games: Game
    ]

	String toString() {
		return deviceType + "(" + (required ? "requried" : "optional") + ")"
	}
    
	Long id
	String deviceType
	Boolean required
	
	Set<Game> games
	
    static constraints = {
		deviceType(blank: false)
		required(nullable: false)
    }
	
    static mapping = {
        table  'devices'
        sort   'id'
        order  'asc'
        version false

        // columns
        id                   column: 'id', generator:'increment'
        games                joinTable:[name: 'gamesToDevices', key: 'deviceId']        	        	
	}	
}
