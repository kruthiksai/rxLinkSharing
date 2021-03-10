//println "+++++++++++++++++++++++  Loading application.groovy configuration  +++++++++++++++++++++++"
//
//grails {
//    profile = 'web'
//    codegen {
//        defaultPackage = 'linksharing'
//    }
//    spring {
//        transactionManagement {
//            proxies = false
//        }
//    }
//}
//
//info {
//    app {
//        name = '@info.app.name@'
//        version = '@info.app.version@'
//        grailsVersion = '@info.app.grailsVersion@'
//    }
//}
//
//spring {
//    groovy {
//        template {
//            setProperty "check-template-location", false
//        }
//    }
//}
//
//endpoints {
//    enabled = false
//    jmx {
//        enabled = true
//        setProperty 'unique-names', true
//    }
//}
//
//grails {
//    mime {
//        disable {
//            accept {
//                header {
//                    userAgents = ['Gecko', 'WebKit', 'Presto', 'Trident']
//                }
//            }
//        }
//
//        types {
//            all = '*/*'
//            atom = 'application/atom+xml'
//            css = 'text/css'
//            csv = 'text/csv'
//            form = 'application/x-www-form-urlencoded'
//            html = ['text/html', 'application/xhtml+xml']
//            js = 'text/javascript'
//            json = ['application/json', 'text/json']
//            multipartForm = 'multipart/form-data'
//            rss = 'application/rss+xml'
//            text = 'text/plain'
//            hal = ['application/hal+json', 'application/hal+xml']
//            xml = ['text/xml', 'application/xml']
//        }
//    }
//
//    urlmapping {
//        cache {
//            maxsize = 1000
//        }
//    }
//
//    controllers {
//        defaultScope = 'singleton'
//    }
//
//    converters {
//        encoding = 'UTF-8'
//    }
//
//    views {
//        'default' { codec = 'html' }//THIS WAS THE SOURCE OF ERROR
//        gsp {
//            encoding = 'UTF-8'
//            htmlcodec = 'xml'
//            codecs {
//                expression = 'html'
//                scriptlets = 'html'
//                taglib = 'none'
//                staticparts = 'none'
//            }
//        }
//    }
//
//}
//
//hibernate {
//    hbm2ddl.auto = 'none'
//    cache {
//        queries = false
//        use_second_level_cache = true
//        use_query_cache = false
//        setProperty 'region.factory_class', 'org.hibernate.cache.ehcache.SingletonEhCacheRegionFactory'
//    }
//    //This is to resolve hibernate many-to-many lazy loading issue
//    enable_lazy_load_no_trans = true
//}
//
//dataSources {
//    dataSource {
//        driverClassName = 'oracle.jdbc.OracleDriver'
//        dialect = 'org.hibernate.dialect.Oracle12cDialect'
//        dbCreate = 'none'
//        pooled = true
//        logSql = false
//        username = 'linksharing'
//        password = "linksharing"
//        url = 'jdbc:oracle:thin:@localhost:1521/orcl'
//    }
//
//    /*Note :  add another data source here to connect with another DB.*/
//    /*database2 {
//        driverClassName = 'oracle.jdbc.OracleDriver'
//        dialect = 'org.hibernate.dialect.Oracle12cDialect'
//        jmxExport = true
//        pooled = true
//        dbCreate = ''
//        logSql = false
//        username = "db2_user"
//        password = "db2_user"
//        url = 'jdbc:oracle:thin:@localhost:1521/orcl'
//    }*/
//
//}
//
//server {
//    compression {
//        enabled = true
//        setProperty 'mime-types', 'application/json,application/xml,text/html,text/xml,text/plain'
//    }
//    port = 8010
//    maxParameterCount = 200000
//}
//
////enable or disable plugin with below config
//grails.plugin.console.enabled = true