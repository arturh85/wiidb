import de.arturh.wiidb.WiiTdbImporter;

import de.arturh.wiidb.Game

class BootStrap {
     def init = { servletContext ->
     	def games = Game.list()
     	if(games.size() == 0) {
		 	WiiTdbImporter importer = new WiiTdbImporter()
			importer.importWiiTdb "web-app/wiitdb.xml"
     	}
     }
     def destroy = {
     }
} 