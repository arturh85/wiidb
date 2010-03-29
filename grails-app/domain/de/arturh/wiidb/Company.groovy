package de.arturh.wiidb

class Company {
	Long id
	
	String code
	String name
	
	String toString() {
		return name
	}
	
    static constraints = {
		name(blank: false, unique: true)		
		code(nullable: true)		
    }
	
    static mapping = {
        table  'companies'
        sort   'name'
        order  'asc'
        version false

        // columns
        id                   column: 'id', generator:'increment'
	}
}
