environments {
    development {
        grails {
            mongo {
                host = "localhost"
                port = 27017
                username = ""
                password = ""
                databaseName = "grails-restful"
            }
        }
    }
    production {
        grails {
            mongo {
                //Heroku Config Variables used for db credentials.
                host = System.env.DB_HOST
                port = System.env.DB_PORT
                username = System.env.DB_USERNAME
                password = System.env.DB_PASSWORD
                databaseName = System.env.DB_NAME

                pooled = true
                options {
                    autoConnectRetry = true
                    connectTimeout = 3000
                    connectionsPerHost = 500
                    socketTimeout = 60000
                    threadsAllowedToBlockForConnectionMultiplier = 5
                    maxAutoConnectRetryTime = 5
                    maxWaitTime = 120000
                }
            }
        }
    }
}
