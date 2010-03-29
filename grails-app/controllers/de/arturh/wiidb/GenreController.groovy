package de.arturh.wiidb

class GenreController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [genreInstanceList: Genre.list(params), genreInstanceTotal: Genre.count()]
    }

    def create = {
        def genreInstance = new Genre()
        genreInstance.properties = params
        return [genreInstance: genreInstance]
    }

    def save = {
        def genreInstance = new Genre(params)
        if (genreInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'genre.label', default: 'Genre'), genreInstance.id])}"
            redirect(action: "show", id: genreInstance.id)
        }
        else {
            render(view: "create", model: [genreInstance: genreInstance])
        }
    }

    def show = {
        def genreInstance = Genre.get(params.id)
        if (!genreInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'genre.label', default: 'Genre'), params.id])}"
            redirect(action: "list")
        }
        else {
            [genreInstance: genreInstance]
        }
    }

    def edit = {
        def genreInstance = Genre.get(params.id)
        if (!genreInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'genre.label', default: 'Genre'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [genreInstance: genreInstance]
        }
    }

    def update = {
        def genreInstance = Genre.get(params.id)
        if (genreInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (genreInstance.version > version) {
                    
                    genreInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'genre.label', default: 'Genre')] as Object[], "Another user has updated this Genre while you were editing")
                    render(view: "edit", model: [genreInstance: genreInstance])
                    return
                }
            }
            genreInstance.properties = params
            if (!genreInstance.hasErrors() && genreInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'genre.label', default: 'Genre'), genreInstance.id])}"
                redirect(action: "show", id: genreInstance.id)
            }
            else {
                render(view: "edit", model: [genreInstance: genreInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'genre.label', default: 'Genre'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def genreInstance = Genre.get(params.id)
        if (genreInstance) {
            try {
                genreInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'genre.label', default: 'Genre'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'genre.label', default: 'Genre'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'genre.label', default: 'Genre'), params.id])}"
            redirect(action: "list")
        }
    }
}
