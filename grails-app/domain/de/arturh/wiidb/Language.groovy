package de.arturh.wiidb

class Language {
	def belongsTo = Game
	
    static hasMany = [
      // many-to-many
      games: Game,
    ]
	Long id
	
	String code
	String name
	
	Set<Game> games

    static constraints = {
		code(blank: false, unique: true)
		name(nullable: true)
    }
	
    static mapping = {
        table  'languages'
        sort   'name'
        order  'asc'
        version false

        // columns
        id                   column: 'id', generator:'increment'
		games                joinTable:[name: 'gamesToLanguages', key: 'languageId']        	
	}
}
