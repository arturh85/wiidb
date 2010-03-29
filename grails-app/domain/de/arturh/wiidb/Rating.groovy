package de.arturh.wiidb

import java.util.Set;

class Rating {
	def belongsTo = Game
    
	static hasMany = [
      // many-to-many
      games: Game
    ]
    
	Long id
	String name
	
	Set<Game> games
	
    static constraints = {
		name(blank: false, unique: true)
    }
	
    static mapping = {
        table  'ratings'
        sort   'name'
        order  'asc'
        version false

        // columns
        id                   column: 'id', generator:'increment'
        games                joinTable:[name: 'gamesToRatings', key: 'ratingId']        	        	
	}	
}
