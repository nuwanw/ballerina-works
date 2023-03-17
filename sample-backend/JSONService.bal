import ballerina/http;


// By default, Ballerina exposes an HTTP service via HTTP/1.1.
// Annotations decorate code.
service http:Service /JSONService on httpListener {

    //curl -v http://localhost:9090/JSONService/hello -H "Content-Type:application/json" -d "{\"name\": \"nuwanw\"}"
    resource function post hello(@http:Payload json payload) returns json | error {
        string name = check payload.name;      
        return  {hello: name};

    }

    //curl -v http://localhost:9090/JSONService/hello/nuwanw
    resource function get hello/[string name]() returns json {
        return  {hello: name};
    }
}
