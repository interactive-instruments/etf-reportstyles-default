## Default ETF report stylesheet

The ETF-ReportStyles are required by the ETF-WebApp at runtime for transforming
test results into human readable reports.

Please note: ETF uses the XSL transformer Xalan in version 2.11.0.beta:

```
compile group: 'xerces', name: 'xercesImpl', version:'2.11.0.beta'
compile group: 'xml-apis', name: 'xml-apis', version:'1.4.01'
```

The internal, older Java RT XSL transformer has problems with the translation
lookup keys in the XSLT, so make sure all changes in the XSLT work with the
newer one.

Please use the [etf-webapp project](https://github.com/interactive-instruments/etf-webapp) for
reporting [issues](https://github.com/interactive-instruments/etf-webapp/issues) or
[further documentation](https://github.com/interactive-instruments/etf-webapp/wiki).

The project can be build and installed by running the gradlew.sh/.bat wrapper with:
```gradle
$ gradlew build install
```

ETF component version numbers comply with the  [Semantic Versioning Specification 2.0.0](http://semver.org/spec/v2.0.0.html).

ETF is an open source test framework developed by [interactive instruments](http://www.interactive-instruments.de/en) for testing geo network services and data.

## Testing with Oxygen

The required Javascript libraries can be downloaded and extracted for testing purposes with:
```
$ gradlew extractJs
```

The Project contains a Oxygen project file, with preconfigured report
transformation scenarios, which can be used for testing.
