***Which programming language and version did you pick?

I picked Ruby.

***Why did you pick this programming language?

I picked Ruby because I recently met someone named Ruby, and they kept popping into my head when I looked at the other options. Additionally, (seemingly) required the least amount of infrastructure to be able to run a simple hello world. I spent much time trying to troubleshoot setting up requirements to run C, C++, and C# in Visual Studio Code, and kept running in to small errors. Finally, I feel Ruby has a very clean look, and enjoyed the practice we’ve had with it in class.

***How does Ruby handle: object-oriented programming, file ingestion, conditional statements, assignment statements, loops, subprograms (functions/methods), unit testing and exception handling. 
	****OOP
		- Everything in Ruby is an Object! Like other OOP languages, Ruby supports classes, objects, inheritance, encapsulation, and polymorphism, and objects have attributes & methods.
	****File Ingestion
		- Ruby reads from files using the Ruby “File” class (providing methods such as “File.open”, “File.read”, and “File.foreach”). In the case of a CSV file, Ruby utilizes the “CSV” library for handling CSV ingestion.
	****Conditional Statements
		- Ruby contains common conditional statements, such as “if”, “else”, and “elsif” (else if statement). Ruby contains uncommon conditional statements, seen in my code, such as “return if”
	****Assignment Statements
		- Ruby contains common assignment statements that assign values to variables; “=“ is Ruby’s primarily used assignment statement
	****Loops
		- Ruby contains common loops, such as “while”, “until”, “for”, and “each”.
	****Subprograms
		- In Ruby, methods are defined using the keyword “def”. Like other OOP languages, methods encapsulate blocks of code, and methods can be called with or without arguments. Ruby also supports instance methods, as well as class methods
	****Unit Testing
		- While Ruby has many testing frameworks, RSpec is the most commonly framework. Like testing frameworks in other OOP languages, tests are organized into test cases, and test that the code behaves as expected.
	****Exception Handling
		- Ruby supports exception handling, utilizing keywords such as “begin”, “rescue”, “ensure”, and “raise”. “Begin” is the equivalent to a “try” statement in java, where “rescue” is akin to a “catch” statement in java. “Ensure” functions similar to an if statement, where a different block of code will run if a “rescue” appears.

***List out 3 libraries you used from your programming language (if applicable) and explain what they are, why you chose them and what you used them for.

For my project, I only required two libraries to successfully complete all the requirements for the project. These two libraries were Ruby’s “CSV” library, and “RSpec” library

	****CSV
		- The CSV library in Ruby allows for reading from, and writing to, CSV files.
		- I chose the CSV library because our data comes from a CSV file, and I needed a way to be able to read from the CSV file, and write to it.
		- I used the CSV library to read the input file (cell.rb), and write to it
		
	**** RSpec
		- The RSpec library in Ruby is a testing framework that allows developers to write unit tests for Ruby projects
		- I chose the RSpec library because it seemed to be the most commonly utilized testing framework in Ruby. In addition, VS Code recommended the RSpec library.
		- I used the RSpec library to write the 3 unit tests required for the project, in my class “cell_tests.rb”

***What company (oem) has the highest average weight of the phone body?
Ulefone
***Was there any phones that were announced in one year and released in another? What are they? Give me the oem and models.
//
***How many phones have only one feature sensor?
419
***What year had the most phones launched in any year later than 1999?
2019
