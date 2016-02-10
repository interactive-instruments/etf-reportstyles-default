## The default ETF report stylesheet

The ETF-ReportStyles are required by the ETF-WebApp at runtime.

Please note: the ETF uses the XSL transformer Xalan in version 2.11.0.beta:

```   
compile group: 'xerces', name: 'xercesImpl', version:'2.11.0.beta'
compile group: 'xml-apis', name: 'xml-apis', version:'1.4.01'
```

The internal, older Java RT XSL transformer has problems with the translation
lookup keys in the XSLT, so make sure all changes in the XSLT work with the
newer one.

The required Javascript libraries can be downloaded and extracted for testing
purposes with `./gradlew extractJs`.

The Project also contains a Oxygen project file, with preconfigured report
transformation scenarios, which can be used for testing.
