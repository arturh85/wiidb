import de.arturh.wiidb.WiiTdbImporter;

import de.arturh.wiidb.Game

class BootStrap {
     def init = { servletContext ->
     	def games = Game.list()
     	if(games.size() == 0) {
			def catalinaBase = System.properties.getProperty('catalina.base')
			def path = "web-app/wiitdb.xml"
			if (catalinaBase) { // if running in grails run-app mode
				path = "webapps/WiiDB/wiitdb.xml"
			}		
		
		 	WiiTdbImporter importer = new WiiTdbImporter()
			importer.importWiiTdb(path)
     	}
     }
     def destroy = {
     }
} 