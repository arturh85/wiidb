import de.arturh.wiidb.WiiTdbImporter;
import org.codehaus.groovy.grails.commons.ApplicationAttributes
import de.arturh.wiidb.Game

class BootStrap {
     def init = { servletContext ->
        def ctx=servletContext.getAttribute(
                       ApplicationAttributes.APPLICATION_CONTEXT)
        def dataSource = ctx.dataSource
 
        dataSource.setMinEvictableIdleTimeMillis(1000 * 60 * 30)
        dataSource.setTimeBetweenEvictionRunsMillis(1000 * 60 * 30)
        dataSource.setNumTestsPerEvictionRun(3)
 
        dataSource.setTestOnBorrow(true)
        dataSource.setTestWhileIdle(false)
        dataSource.setTestOnReturn(false)
        dataSource.setValidationQuery("SELECT 1")
 
        dataSource.properties.each { 
			println "db property: " + it 
		}
	 
     	def games = Game.list()
		
		// only import game list when starting up with an empty database
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