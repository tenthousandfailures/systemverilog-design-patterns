## Strategy Pattern implemented in SystemVerilog Example

See the URL for more
<https://tenthousandfailures.com/blog/>

There is a wonderful tutorial on Lynda.com on Design Patterns.

[Foundations of Programming: Design Patterns]
(http://www.lynda.com/Developer-Programming-Foundations-tutorials/Foundations-Programming-Design-Patterns/135365-2.html)
by Elisabeth Robson and Eric Freeman

From that link, you may download the example code of their Design Patterns tutorial from Lynda.com.

The examples are done in Java and since I am programming in SystemVerilog, this was good opportunity to follow along.  The ability to do this in SystemVerilog is only part of the 2012 IEEE specifictaion and is implemented in Mentor Questa 10.3a.

This my is implementation of their example of the Strategy Pattern from Chapter 2 (CH02).  I tried to be as close as possible to the Java implementation to make it easier to follow along.  In the main program I do extend it to fully test out all of the functions of the classes used.

I wrote a short shell script that will run the tutorial code.

## Command Lines for Mentor Questa to Run
```shell
 > ./compile.sh
```

The final log for what comes out of the sim is in the file called "log".

## Authors
* Original Source by Elisabeth Robson and Eric Freeman
* Translation from Java to SystemVerilog done by Eldon Nelson
