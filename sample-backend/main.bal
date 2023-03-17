import ballerina/io;

public function main() {
    int port = httpListener.getPort();

    io:println("Server Started on port " , port);
    io:println("SleepService");
    io:println("    curl -v http://localhost:", port, "/SleepService/sleep -H \"Content-Type:application/xml\" -d \"<sleep>2000</sleep>\"");
    io:println("    curl -v http://localhost:", port, "/SleepService/sleep/time/2000");
    io:println("HelloService");
    io:println("    curl -v http://localhost:", port, "/HelloService/hello -H \"Content-Type:application/xml\" -d \"<name>Nuwanw</name>\"");
    io:println("    curl -v http://localhost:", port, "/HelloService/hello/nuwanw");
    io:println("JSONService");
    io:println("    curl -v http://localhost:", port, "/JSONService/hello -H \"Content-Type:application/json\" -d '{\"name\": \"nuwnaw\"}'");
    io:println("    curl -v http://localhost:", port, "/JSONService/hello/nuwanw");
    io:println("LargeJSONService");
    io:println("    curl -v http://localhost:", port, "/LargeJSONService/hello -H \"Content-Type:application/json\" -d '{\"name\": \"nuwnaw\"}'");
    io:println("    curl -v http://localhost:", port, "/LargeJSONService/hello/nuwanw");    
    io:println("EchoService");
    io:println("    curl -v http://localhost:", port, "/echo/body -H \"Content-Type:application/xml\" -d \"<echo>2000</echo>\"");
    io:println("    curl -v http://localhost:", port, "/echo/headers -H \"Content-Type:application/xml\" -d \"<echo>2000</echo>\"");
    io:println("    curl -v http://localhost:", port, "/echo/headers -H \"Name:Hello\""); 
}
