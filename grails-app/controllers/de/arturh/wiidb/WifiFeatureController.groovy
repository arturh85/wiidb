package de.arturh.wiidb

class WifiFeatureController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [wifiFeatureInstanceList: WifiFeature.list(params), wifiFeatureInstanceTotal: WifiFeature.count()]
    }

    def create = {
        def wifiFeatureInstance = new WifiFeature()
        wifiFeatureInstance.properties = params
        return [wifiFeatureInstance: wifiFeatureInstance]
    }

    def save = {
        def wifiFeatureInstance = new WifiFeature(params)
        if (wifiFeatureInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'wifiFeature.label', default: 'WifiFeature'), wifiFeatureInstance.id])}"
            redirect(action: "show", id: wifiFeatureInstance.id)
        }
        else {
            render(view: "create", model: [wifiFeatureInstance: wifiFeatureInstance])
        }
    }

    def show = {
        def wifiFeatureInstance = WifiFeature.get(params.id)
        if (!wifiFeatureInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'wifiFeature.label', default: 'WifiFeature'), params.id])}"
            redirect(action: "list")
        }
        else {
            [wifiFeatureInstance: wifiFeatureInstance]
        }
    }

    def edit = {
        def wifiFeatureInstance = WifiFeature.get(params.id)
        if (!wifiFeatureInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'wifiFeature.label', default: 'WifiFeature'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [wifiFeatureInstance: wifiFeatureInstance]
        }
    }

    def update = {
        def wifiFeatureInstance = WifiFeature.get(params.id)
        if (wifiFeatureInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (wifiFeatureInstance.version > version) {
                    
                    wifiFeatureInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'wifiFeature.label', default: 'WifiFeature')] as Object[], "Another user has updated this WifiFeature while you were editing")
                    render(view: "edit", model: [wifiFeatureInstance: wifiFeatureInstance])
                    return
                }
            }
            wifiFeatureInstance.properties = params
            if (!wifiFeatureInstance.hasErrors() && wifiFeatureInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'wifiFeature.label', default: 'WifiFeature'), wifiFeatureInstance.id])}"
                redirect(action: "show", id: wifiFeatureInstance.id)
            }
            else {
                render(view: "edit", model: [wifiFeatureInstance: wifiFeatureInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'wifiFeature.label', default: 'WifiFeature'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def wifiFeatureInstance = WifiFeature.get(params.id)
        if (wifiFeatureInstance) {
            try {
                wifiFeatureInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'wifiFeature.label', default: 'WifiFeature'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'wifiFeature.label', default: 'WifiFeature'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'wifiFeature.label', default: 'WifiFeature'), params.id])}"
            redirect(action: "list")
        }
    }
}
