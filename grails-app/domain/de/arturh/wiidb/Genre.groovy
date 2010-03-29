package de.arturh.wiidb

import java.util.Set;

class Genre {
	def belongsTo = Game
    static hasMany = [
      // many-to-many
      games: Game,
    ]

    Long id
	String name
	
	Set<Game> games

    static constraints = {
		name(blank: false, unique: true)
    }
	
    static mapping = {
        table  'genres'
        sort   'name'
        order  'asc'
        version false

        // columns
        id                   column: 'id', generator:'increment'
		games                joinTable:[name: 'gamesToGenres', key: 'genreId']        	
	}
}
