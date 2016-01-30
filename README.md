## The default ETF report stylesheet

The ETF-ReportStyles are required by the ETF-WebApp at runtime.

Please note: the ETF uses the XSL transformer Xalan which can be found in the
interactive instruments repository (gradle dependencies):

`   compile group: 'xerces', name: 'xercesImpl', version:'2.11.0.beta'`
`    compile group: 'xml-apis', name: 'xml-apis', version:'1.4.01' `.

The internal, older Java RT XSL transformer has problems with the translation 
lookup keys in the XSLT, so make sure all changes in the XSLT work with the
newer one.

The required Javascript libraries can be downloaded and extracted for testing
purposes with `./gradlew extractJs`.
You can publish the library by uploading it to the interactive instruments 
repository with `./gradlew uploadArchives` (NOTE: the repository does not allow
the overwriting of existing libraries so make sure to increment the library 
version in the build.gradle file).