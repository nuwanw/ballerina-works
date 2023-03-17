import ballerina/http;
import ballerina/io;
import ballerina/lang.runtime;


// By default, Ballerina exposes an HTTP service via HTTP/1.1.
// Annotations decorate code.
service http:Service /SleepService on httpListener {

    // Resource functions are invoked with the HTTP caller and the incoming request as arguments.
    //curl -v http://localhost:9090/sleep -H "Content-Type:application/xml" -d "<sleep>2000</sleep>"
    // resource function post sleep(@http:Payload xml payload) returns xml|error {
    //     int|error time =  int:fromString((payload.<sleep>).data());
    //     if time is error {
    //     return error ("Time should be integer " + time.message());
    //     }
    //     io:println("Sleeping... " , time, " mills");
    //    // lang:Sleep(count);
    //     return xml `<msg>Hello</msg>`;

    // }

    //curl -v http://localhost:9090/sleep/time/2000.
    // resource function get sleep/time/[int time]() returns xml {
    //     io:println("Sleeping... " , time, " mills");
    //    // lang:Sleep(count);
    //     return xml `<msg>Hello</msg>`;
    // }

    //curl -v http://localhost:9090/SleepService/sleep -H "Content-Type:application/xml" -d "<sleep>2000</sleep>"
    resource function post sleep(@http:Payload xml payload) returns xml|http:Response {
        decimal|error time = decimal:fromString((payload.<sleep>).data());
        if time is error {
            xml errorPayload = xml `<error>Time should be integer > ${time.message()}</error>`;
            http:Response response = new;
            response.statusCode = 500;
            response.setXmlPayload(errorPayload);
            return response;
        }
        io:println("Sleeping... ", time, " mills");
        runtime:sleep(time / 1000);
        return xml `<msg>Hello</msg>`;

    }

    //curl -v http://localhost:9090/SleepService/sleep/time/2000
    resource function get sleep/time/[string counter]() returns xml|http:Response {
        decimal|error time = decimal:fromString(counter);
        if time is error {
            xml errorPayload = xml `<error>Time should be integer > ${time.message()}</error>`;
            http:Response response = new;
            response.statusCode = 500;
            response.setXmlPayload(errorPayload);
            return response;
        }
        io:println("Sleeping... ", time, " mills");
        runtime:sleep(time / 1000);
        return xml `<msg>Hello</msg>`;
    }
}
