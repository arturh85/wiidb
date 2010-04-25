dataSource {
	pooled = true
	driverClassName = "org.hsqldb.jdbcDriver"
	username = "sa"
	password = ""
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost/wiidb"
            driverClassName = "com.mysql.jdbc.Driver"
            username = "root"
            password = ""
		}
	}
	test {
		dataSource {
			dbCreate = "create-drop"
			url = "jdbc:hsqldb:mem:testDb"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			url = "jdbc:mysql://localhost/wiidb"
			driverClassName = "com.mysql.jdbc.Driver"
			username = "wiidb"
			password = "qRvetWe7dwB3sLLv"
		}
	}
}