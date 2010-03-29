class UtilTagLib {
    def formatList = { attrs ->
        def list = attrs['list']
        def property = attrs['property']

        def first = true

        if(list == null) {
            log.error "parameter list was null"
            return
        }

        for(i in list) {
            if(i == null) {
                log.warn "entry in list was null"
                continue
            }

            if(first) {
                if(property) {
                    out << i.getProperty(property)
                } else {
                    out << i
                }
                first = false;
            } else {
                if(property) {
                    out << ", " + i.getProperty(property)
                } else {
                    out << ", " + i
                }
            }
        }

        out
    }
}
