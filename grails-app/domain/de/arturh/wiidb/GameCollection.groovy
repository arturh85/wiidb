package de.arturh.wiidb

class GameCollection {
	def belongsTo = Game
    static hasMany = [
	  // many-to-many
	  games: Game
	]
        	
    Long id
	String name

	Set<Game> games

	String toString() {
		return name
	}
	
    static constraints = {
		name(blank: false, unique: true)
    }
	
    static mapping = {
        table  'gameCollections'
        sort   'name'
        order  'asc'
        version false

        // columns
        id                   column: 'id', generator:'increment'
		games                joinTable:[name: 'gamesToGameCollections', key: 'gameCollectionId']        	
	}
}
