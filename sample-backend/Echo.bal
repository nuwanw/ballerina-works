import ballerina/http;

// By default, Ballerina exposes an HTTP service via HTTP/1.1.
// Annotations decorate code.
service http:Service /echo on httpListener {

    //curl -v http://localhost:9090/echo/body -H "Content-Type:application/xml" -d "<echo>2000</echo>"
    resource function post body(http:Request request) returns http:Response|error {
        http:Response response = new;
        string contentType = request.getContentType();
        error? contentTypeResult = response.setContentType(contentType);
        if contentTypeResult is error {
            return error("Bad Request");
        }
        response.setBinaryPayload(check request.getBinaryPayload());
        return response;

    }

    //curl -v http://localhost:9090/echo/headers -H "Content-Type:application/xml" -d "<echo>2000</echo>"
    resource function post headers(http:Request request) returns http:Response|error {
        http:Response response = new;
        map<string> headers = {};

        foreach string hName in request.getHeaderNames() {
            string h = check request.getHeader(hName);
            headers[hName] = h;

        }
        response.setJsonPayload(headers.toJson());
        return response;

    }

        //curl -v http://localhost:9090/echo/headers -H "Name:Hello" 
    resource function get headers(http:Request request) returns http:Response|error {
        http:Response response = new;
        map<string> headers = {};

        foreach string hName in request.getHeaderNames() {
            string h = check request.getHeader(hName);
            headers[hName] = h;
        }
        response.setJsonPayload(headers.toJson());
        return response;
    }

}
