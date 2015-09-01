modules = {
    application {
        resource url:'js/application.js'
    }
    'jquery-ui' {
        dependsOn('jquery')
        resource url:"js/jquery-ui-1.js",disposition: "head"
    }
}