package com.scrum

import grails.rest.RestfulController
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.servlet.HttpHeaders

import static com.scrum.ScrumUtil.EXCLUDE_FIELD_LIST
import static org.springframework.http.HttpStatus.*

/**
 * Controller expose the API to support CRUD operation on @code Project
 */
class ProjectController extends RestfulController<Project>{

    static responseFormats = ['html', 'json', 'xml']
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", index: "GET", list: "GET"]

    def springSecurityService;

    /**
     * Default constructor with 0 parameter.
     */
    ProjectController() {
        super(Project)
    }

    /**
     * Lists all the projects.
     *
     * @param max  maximum projects to return
     * @return  xml/json/html according to mime type.
     */
    @Override
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Project.list(params), view: 'index', model:[params:params, projectInstanceCount: Project.count(), excludes: EXCLUDE_FIELD_LIST]
    }

    /**
     * To save the project in db.
     *     <code>
     *         <pre>
     *             def projectInstance = createResource(params)
     *             projectInstance.save()
     *         </pre>
     *     </code>
     *
     * @return created projectInstance
     */
    @Transactional
    @Override
    def save() {
        log.info("Project save action called......");
        def projectInstance = createResource();
        if (projectInstance == null) {
            notFound()
            return
        }
        def loggedInUser = springSecurityService.getCurrentUser()

        projectInstance.createdBy = loggedInUser
        projectInstance.validate()
        if (projectInstance.hasErrors()) {
            respond projectInstance.errors, view:'create'
            return
        }

        projectInstance.save flush:true

        flash.message = "Project has been created."

        request.withFormat {
            form multipartForm {
                redirect projectInstance
            }
            '*' {
                response.addHeader(HttpHeaders.LOCATION, g.createLink(
                                resource: this.controllerName, action: 'show',id: projectInstance.id, absolute: true,
                                namespace: hasProperty('namespace') ? this.namespace : null ))

                respond projectInstance, [status: CREATED, excludes: EXCLUDE_FIELD_LIST]
            }
        }
    }

    def list(){
        respond Project.list(), model:[projectInstanceCount: Project.count()], view: 'index'
    }

    /**
     * To get the project by given id.
     *
     * @param project
     * @return
     */
    def show(Project project) {

        if(!project){
            def model = [ success: false, msg: [ code: 404, text: "The Project could not be found"]]
            // 404 status for all, JSON/XML/HTML appropriate response with detail
            respond model as Object, [model: model, status: 404, view: 'error404']
        }else{
            respond (project, model: [projectInstance: project], view: 'show')
            return
        }

        render status: NOT_FOUND
    }

    /**
     * To Delete project from db.
     *
     * @return
     */
    @Transactional
    def delete() {
        log.info("delete is being called.....");
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
                flash.message = message(code: 'default.deleted.message', args: [message(code: "${resourceClassName}.label".toString(), default: resourceClassName), instance.name])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT } // NO CONTENT STATUS CODE
        }
    }
}
