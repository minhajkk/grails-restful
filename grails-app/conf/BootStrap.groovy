import org.springframework.web.context.support.WebApplicationContextUtils

class BootStrap {
    def grailsApplication

    def init = { servletContext ->
        //Get spring context
        //def springContext = WebApplicationContextUtils.getWebApplicationContext( servletContext )
        // register Custom Object Marshaller
        //springContext.getBean( "customMarshallerRegistrar").register()
    }
    def destroy = {
    }
}
