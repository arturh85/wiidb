package de.arturh.wiidb

class GameCollectionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [gameCollectionInstanceList: GameCollection.list(params), gameCollectionInstanceTotal: GameCollection.count()]
    }

    def create = {
        def gameCollectionInstance = new GameCollection()
        gameCollectionInstance.properties = params
        return [gameCollectionInstance: gameCollectionInstance]
    }

    def save = {
        def gameCollectionInstance = new GameCollection(params)
        if (gameCollectionInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'gameCollection.label', default: 'GameCollection'), gameCollectionInstance.id])}"
            redirect(action: "show", id: gameCollectionInstance.id)
        }
        else {
            render(view: "create", model: [gameCollectionInstance: gameCollectionInstance])
        }
    }

    def show = {
        def gameCollectionInstance = GameCollection.get(params.id)
        if (!gameCollectionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'gameCollection.label', default: 'GameCollection'), params.id])}"
            redirect(action: "list")
        }
        else {
            [gameCollectionInstance: gameCollectionInstance]
        }
    }

    def edit = {
        def gameCollectionInstance = GameCollection.get(params.id)
        if (!gameCollectionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'gameCollection.label', default: 'GameCollection'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [gameCollectionInstance: gameCollectionInstance]
        }
    }

    def update = {
        def gameCollectionInstance = GameCollection.get(params.id)
        if (gameCollectionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (gameCollectionInstance.version > version) {
                    
                    gameCollectionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'gameCollection.label', default: 'GameCollection')] as Object[], "Another user has updated this GameCollection while you were editing")
                    render(view: "edit", model: [gameCollectionInstance: gameCollectionInstance])
                    return
                }
            }
            gameCollectionInstance.properties = params
            if (!gameCollectionInstance.hasErrors() && gameCollectionInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'gameCollection.label', default: 'GameCollection'), gameCollectionInstance.id])}"
                redirect(action: "show", id: gameCollectionInstance.id)
            }
            else {
                render(view: "edit", model: [gameCollectionInstance: gameCollectionInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'gameCollection.label', default: 'GameCollection'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def gameCollectionInstance = GameCollection.get(params.id)
        if (gameCollectionInstance) {
            try {
                gameCollectionInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'gameCollection.label', default: 'GameCollection'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'gameCollection.label', default: 'GameCollection'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'gameCollection.label', default: 'GameCollection'), params.id])}"
            redirect(action: "list")
        }
    }
}
