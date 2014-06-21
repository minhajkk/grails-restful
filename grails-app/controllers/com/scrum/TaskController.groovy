package com.scrum

import grails.rest.RestfulController
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.servlet.HttpHeaders

import static com.scrum.ScrumUtil.EXCLUDE_FIELD_LIST
import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.NOT_FOUND

class TaskController extends RestfulController<Task>{
    static responseFormats = ['html', 'json', 'xml']

    def springSecurityService;

    TaskController() {
        super(Task)
    }

    @Override
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Project.list(params), model:[projectInstanceCount: Project.count()]
    }

    @Transactional
    def save() {
        println("save is called: TASK");
        println("params: $params");
        def taskInstance = createResource(params);

        if (taskInstance == null) {
            notFound()
            return
        }

        taskInstance.reportedBy = springSecurityService.getCurrentUser();
        taskInstance.assignedTo = springSecurityService.getCurrentUser();

        flash.message = "Task has been added."

        taskInstance.validate()
        if (taskInstance.hasErrors()) {
            println("taskInstance.errors: ${taskInstance.errors}");
            respond taskInstance.errors
            return
        }

        taskInstance.save flush:true

        request.withFormat {
            js{
                render text: "success"
            }
            form multipartForm {
                redirect taskInstance.project
            }
            '*' {
                response.addHeader(HttpHeaders.LOCATION, g.createLink(
                        resource: this.controllerName, action: 'show',id: taskInstance.id, absolute: true,
                        namespace: hasProperty('namespace') ? this.namespace : null ))

                respond taskInstance, [status: CREATED, excludes: EXCLUDE_FIELD_LIST]
            }
        }
    }

    def list(){
        respond Project.list(), model:[projectInstanceCount: Project.count()]
    }

    def show(Task task) {
        println("Printing Tasl : $task");
        if(task){
            respond (task, model: [taskInstance: task], view: 'show')
            return
        } else {
            def model = [ success: false, msg: [ code: 404, text: "The Project could not be found"]]
            // 404 status for all, JSON/XML/HTML appropriate response with detail
            respond model as Object, [model: model, status: 404, view: 'error404']
            return
        }

        render status: NOT_FOUND

    }

    @Transactional
    def delete() {
        if(handleReadOnly()) {
            return
        }

        def instance = queryForResource(params.id)
        if (instance == null) {
            notFound()
            return
        }

        instance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: "${resourceClassName}.label".toString(), default: resourceClassName), instance.id])
                redirect instance.project
            }
            '*'{ render status: NO_CONTENT } // NO CONTENT STATUS CODE
        }
    }
}
