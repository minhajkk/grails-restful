package com.scrum.util

import com.scrum.Project
import grails.converters.JSON

import javax.annotation.PostConstruct

/**
 * Created with IntelliJ IDEA.
 * User: minhaj
 * Date: 6/19/14
 * Time: 12:48 AM
 * To change this template use File | Settings | File Templates.
 */
class CustomMarshallerRegistrar {

    static lazyInit = false

    @PostConstruct
    void register() {

        JSON.registerObjectMarshaller (Project) { Project project ->
            def output = [:]
            output['id'] = project.id
            output['name'] = project.name
            output['description'] = project.description
            output['reporter'] = project.createdBy.username
            return output;
        }
        log.info "Finished registering Project Marshal"
    }
}
