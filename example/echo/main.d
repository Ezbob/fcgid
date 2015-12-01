import std.concurrency;
import fcgi.stdio;


struct A
{
    int a;
    int b;
    char[] str = ['h', 'e', 'l', 'l', 'o'];
    
    struct B
    {
        bool b = true;
        bool b = false;
        uint ui = 123;
        string str = "a string";
    }
}

void threadMain(ubyte n)
{
    while(accept)
    {
    	"Content-Type: text/html; charset=UTF-8\r\n"
    	"\r\n"
    	.write;
    	
    	"<html>\n"
    	"<head>\n"
    	"<title>Title: Simple FastCGI Loop</title>\n"
    	"</head>\n"
    	"<body>\n"
    	"<h1>FastCGI in D</h1>\n"
    	"<h2>中文内容</h2>\n"
    	.write;
    	
        writeln("<pre>");
        writeln("thread:", n);
    	writeln(request.params["SCRIPT_NAME"]);
    	foreach(name, value; request.params)
    	{
    	    writeln(name ~" : " ~ value);
    	}
    	
    	writeln("test writeln");
    	writef("the number is %d %s",  100, ".");
    	writeln(true);
    	A a = {12, 999};
        writeln(a);
        
        writefln("wstring %s", "是要工"w);
    	writeln("xxxxxxxxxx");
        writeln("</pre>");
    	"</body>\n"
    	"</html>\n"
    	.write;
    	
    	finish;
    }
}

void main() 
{
    for (ubyte i=0; i<128; i++) {
        spawn(&threadMain, i);
    }
}