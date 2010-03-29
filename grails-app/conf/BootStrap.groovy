import de.arturh.wiidb.WiiTdbImporter;

class BootStrap {
     def init = { servletContext ->
	 	WiiTdbImporter importer = new WiiTdbImporter()
		importer.importWiiTdb "web-app/wiitdb.xml"
     }
     def destroy = {
     }
} 