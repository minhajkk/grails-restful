class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'project', action: 'index')
        "500"(view:'/error')

        // RESTService api
        "/v1/api/projects"(resources: 'project')
        "/v1/api/comments"(resources: 'comment')
        "/v1/api/tasks"(resources: 'task')

        "/v2/api/projects"(resources: 'project')
        "/v2/api/comments"(resources: 'comment')
        "/v2/api/tasks"(resources: 'task')

        name register: "/register" {
            controller = 'userRegister'
            action = 'index'
        }
	}
}
