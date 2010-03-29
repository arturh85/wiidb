package de.arturh.wiidb

import org.slf4j.LoggerFactory;
import org.slf4j.impl.Log4jLoggerFactory;
import grails.converters.*

class WiiTdbImporter {
	def log = LoggerFactory.getLogger(WiiTdbImporter.class); 
	
	def importWiiTdb(String path) {
		log.info "started importing wii tdb file"
		
		def xml = XML.parse(new FileInputStream(path), "UTF-8")

		xml.companies.company.each { 
			def company = new Company()
			company.name = it.@name
			company.code = it.@code
						
			if(company.hasErrors()) {
				company.errors.each {
					println "error validating company: " + it
				}
			}
			
			company.save(flush:true)
		}
			
		xml.game.each { 
			def game = new Game()
			game.name = it.@name
			
			game.wiiId = it.id
			game.region = it.region
			
			def title = null
			def synopsis = null
			
			it.locale.each { locale ->
				if(title == null && locale.@lang == 'DE') {
					title = locale.title
					synopsis = locale.synopsis
				}
				
				if(locale.@lang == 'EN') {
					title = locale.title
					synopsis = locale.synopsis
				}
			}
			
			game.title = title
			game.synopsis = synopsis
			
			if(it.developer && it.developer.toString().size() > 0) {
				def company = _getCompanyByName(it.developer)
				game.developer = company
			}
			
			if(it.publisher && it.publisher.toString().size() > 0) {
				def company = _getCompanyByName(it.publisher)
				game.publisher = company
			}
			
			if(it.genre && it.genre.toString().size() > 0) {
				def genres = it.genre.toString().split(",")
				genres.each {
					it = it.trim()
					def genre = Genre.findByName(it)
					if(genre == null) {
						genre = new Genre()
						genre.name = it

						if(genre.hasErrors()) {
							genre.errors.each {
								println "error validating genre: " + it
							}
						}
						
						genre.save(flush: true)
					}
					
					game.addToGenres(genre)
				}
			}

			it.rating.descriptor.each {
				def descriptor = it.toString()
				
				def rating = Rating.findByName(descriptor)
				if(rating == null) {
					rating = new Rating()
					rating.name = descriptor

					if(rating.hasErrors()) {
						rating.errors.each {
							println "error validating rating: " + it
						}
					}
					
					rating.save(flush: true)
				}
				
				game.addToRatings(rating)
			}

			it.input.control.each {
				def deviceType = it.@type.toString()
				def deviceRequired = it.@required.toBoolean()
				
				def device = Device.findWhere(deviceType: deviceType, required: deviceRequired)
				if(device == null) {
					device = new Device()
					device.deviceType = deviceType
					device.required = deviceRequired

					if(device.hasErrors()) {
						device.errors.each {
							println "error validating device: " + it
						}
					}
					
					device.save(flush: true)
				}
				
				game.addToDevices(device)
			}
			

			it."wi-fi".feature.each {
				def name = it.toString()
				
				def wifiFeature = WifiFeature.findByName(name)
				if(wifiFeature == null) {
					wifiFeature = new WifiFeature()
					wifiFeature.name = name

					if(wifiFeature.hasErrors()) {
						wifiFeature.errors.each {
							println "error validating wifiFeature: " + it
						}
					}
					
					wifiFeature.save(flush: true)
				}
				
				game.addToWifiFeatures(wifiFeature)
			}			
			
			if(it.languages && it.languages.toString().size() > 0) {
				def languages = it.languages.toString().split(",")
				languages.each {
					it = it.trim()
					def language = Language.findByCode(it)
					if(language == null) {
						language = new Language()
						language.code = it
						
						if(language.hasErrors()) {
							language.errors.each {
								println "error validating language: " + it
							}
						}
						
						language.save(flush: true)
					}
					
					game.addToLanguages(language)
				}
			}
			
			def year = it.date?.@year
			def month = it.date?.@month
			def day = it.date?.@day

			def publishedOn = "${year}/${month}/${day}"

			try {
				def publishedOnDate = Date.parse(publishedOn, "yyyy/MM/dd")
				if(publishedOnDate) {
					game.publishedOn = publishedOnDate
				}
			} catch(Exception e) {}
			
			game.playersWifi = it."wi-fi"?.@players?.toInteger()
			game.players = it.input?.@players?.toInteger()
			
			game.ratingType = it.rating?.@type
			game.ratingValue = it.rating?.@value
					
			if(game.hasErrors()) {
				game.errors.each {
					println "error validating game: " + it
				}
			}
			game.save(flush:true)
		}

		log.info "finished importing wii tdb file"

		def games = Game.list()
		log.info "${games.size()} games imported"
		
		def companies = Company.list()
		log.info "${companies.size()} companies imported"
		
		def languages = Language.list()
		log.info "${languages.size()} languages imported"
		
		def devices = Device.list()
		log.info "${devices.size()} devices imported"
		
		def genres = Genre.list()
		log.info "${genres.size()} genres imported"

		def wifiFeatures = WifiFeature.list()
		log.info "${wifiFeatures.size()} wifiFeatures imported"
		
		def ratings = Rating.list()
		log.info "${ratings.size()} ratings imported"
	}
	
	def _getCompanyByName(name) {
		def company = Company.findByName(name.toString())
		if(company == null) {
			company = new Company()
			company.name = name
			company.code = null

			if(company.hasErrors()) {
				company.errors.each {
					println "error validating company: " + it
				}
			}
			
			company.save(flush:true)
		} 
		
		return company
	}
}
