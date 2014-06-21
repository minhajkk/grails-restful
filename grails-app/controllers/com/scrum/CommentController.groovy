package com.scrum

import grails.rest.RestfulController
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.servlet.HttpHeaders

import static com.scrum.ScrumUtil.EXCLUDE_FIELD_LIST
import static org.springframework.http.HttpStatus.CREATED

class CommentController extends RestfulController<Comment>{

    static responseFormats = ['json', 'xml', 'html']

    def springSecurityService

    CommentController(){
        super(Comment)
    }

    def index() {}

    @Transactional
    def save() {
        println("save is called: COMMENT");
        println("params: $params");
        def commentInstance = createResource(params);

        if (commentInstance == null) {
            notFound()
            return
        }

        commentInstance.user = springSecurityService.getCurrentUser();

        flash.message = "Comment has been added."

        commentInstance.validate()
        if (commentInstance.hasErrors()) {
            println("commentInstance.errors: ${commentInstance.errors}");
            respond commentInstance.errors
            return
        }

        commentInstance.save flush:true

        request.withFormat {
            js{
                render text: "success"
            }
            form multipartForm {
                redirect commentInstance.task
            }
            '*' {
                response.addHeader(HttpHeaders.LOCATION, g.createLink(
                        resource: this.controllerName, action: 'show',id: taskInstance.id, absolute: true,
                        namespace: hasProperty('namespace') ? this.namespace : null ))

                respond commentInstance, [status: CREATED, excludes: EXCLUDE_FIELD_LIST]
            }
        }
    }
}
