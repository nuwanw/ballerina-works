import ballerina/http;

// By default, Ballerina exposes an HTTP service via HTTP/1.1.
// Annotations decorate code.
service http:Service /HelloService on httpListener {

    //curl -v http://localhost:9090/HelloService/hello -H "Content-Type:application/xml" -d "<name>Nuwanw</name>"
    resource function post hello(@http:Payload xml payload) returns xml {
        string name = (payload.<name>).data();
        return xml `<hello>${name}</hello>`;

    }

    //curl -v http://localhost:9090/HelloService/hello/nuwanw
    resource function get hello/[string name]() returns xml {
        return xml `<hello>${name}</hello>`;
    }
}
