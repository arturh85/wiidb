package de.arturh.wiidb

class Game {
	//static searchable = true
    static hasMany = [
      // many-to-many
      languages: Language,
      genres: Genre,
      devices: Device,
      wifiFeatures: WifiFeature,
    ]

	Long id
	String wiiId // imported
	String name // imported
	String region // imported 
	String title // imported
	String synopsis // imported
	
	Company developer
	Company publisher
	
	Date publishedOn
	
	String ratingType
	String ratingValue
	
	Integer players
	Integer playersWifi

	Set<Language> languages
	Set<WifiFeature> wifiFeatures
	Set<Genre> genres
	Set<Device> devices
	
    static constraints = {
		wiiId(blank: false, size:6..6, unique: true)
		name(blank: false)
		
		region(nullable: true)
		title(nullable: true)
		synopsis(nullable: true)
		
		publishedOn(nullable: true)
		ratingType(nullable: true)
		ratingValue(nullable: true)
		players(nullable: true)
		playersWifi(nullable: true)

		developer(nullable: true)
		publisher(nullable: true)
	}
	
    static mapping = {
        table  'games'
        sort   'name'
        order  'asc'
        version false

        // columns
        id                   column: 'id', generator:'increment'
        	
        languages            joinTable:[name: 'gamesToLanguages', key: 'gameId']
        wifiFeatures         joinTable:[name: 'gamesToWifiFeatures', key: 'gameId']
        genres               joinTable:[name: 'gamesToGenres', key: 'gameId']
        devices       		 joinTable:[name: 'gamesToDevices', key: 'gameId']
	}
}
