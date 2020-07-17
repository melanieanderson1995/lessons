# Notes Week 1 #
## Monday July 6 ##
* Expect to not finish things
* Expect gear changes
* Things move very quickly
* There’s support for Imposter Syndrome
  * Take a step back
  * Break it into smaller chunks
  * There is a 1-1 option with Dana
* "I’m not good at this YET"
* Avoid “shoulds”
* Trust the process
* Feedback must be kind
* Takes about 3-4 weeks to settle into the balance
* There will be a frustration phase
* Become comfortable with the discomfort
* Holistic coaching sessions
* Book using the form pinned to the channel
* Bring notepad
* Communicate
* Daily pair check-ins

## Tuesday July 7 ##
* OO programming = object oriented programming
  * 4 principles: encapsulation, abstraction, inheritance, polymorphism
  * Abstraction: each object should only expose a high-level mechanism for using it
    * Should hide internal implementation details
    * Should reveal operations relevant for other objects
    * Implementation changes rarely affect the abstraction you use
  * Inheritance: Create a child class by deriving from a parent class to form a hierarchy
  * Polymorphism: gives a way to use a class exactly like its parent so there's no confusion with mixing types. But each child class keeps its own methods as they are
    * Typically happens by defining a parent interface to be reused
  * Encapsulation: wrapping up of data under a single unit
    * Protective shield that prevents the data from being accessed by the code outside the shield
    * The variables or data of a class are hidden from any other class
    * Can be achieved by declaring all the variables in the class as private and writing public methods in the class to set and get the values of the variables
  * SRP = single responsibility principle

## Wednesday July 8 ##
* Need more specific goals
* Spend more time focus setting
* Rspec is a testing framework
  * Domain specific language (Rspec has added additional language features on top of Ruby language)
    * "describe" is Rspec not Ruby
  * Behavior-Driven Dev
  * Focus on tests
  * Always create a lib and spec directory
  * Require lib file at top of spec file
  * Describe Class do ... end
  * Use "it" method to declare example
  * Assertions are called "expectations" (.should, should be_false, .should be, .should_not, etc)
    * .should is the modifier
    * matcher is what follows the modifier
  * Understand testing better
    * Feature testing: testing the application by interacting with it just like a real user would do. So they are integration tests.
      * You click on links, buttons, fill in forms, interact with popups, etc.
      * Very slow
    * Unit testing: testing an individual unit, such as a method in a class, with all dependencies mocked up
      * About domain logic and edge cases
      * Very fast
* Single Responsibility principle
  * Each thing should do ONE tasks
  * If class description has AND in it then it needs to be refactored
    * Prints invoice AND emails invoice AND ...
  * By refactoring the program different classes can be used independently or by any other class
  * ANDs mean the classes are coupled, which makes it more complicated and relies on using all the classes rather than the one you're looking for
* Debugging workshop
  * What is a bug?
    * Unintended error
    * Something stopping the program from running properly
  * Debugging is finding bugs and fixing them
  * Learning objectives:
    * Explain Makers mantra "tighten the loop; get visibility"
    * Use "tighten the loop; get visibility"
    * Define "debugging" as the process of eliminating bugs from an expected program output
  * "Tighten the loop"
    * Find exact line bug is coming from
    * Look at the error message
  * Process of debugging
    * 1: Formulate hypothesis about error message
    * 2: Look for line number and path to identify which file (tighten the loop)
    * 3: Get visibility (verify that the thing we THINK is the problem is actually the problem)
      * Change something in the code and run again
      * Print the value (using "p" or "puts")
    * "Wisest are they who try only one thing to fix the problem"
    * 4: If it STILL fails go back and try something else, if it fails on later line do the same process on the new line
  * Types of error messages
    * Unexpected end of input: syntax error
    * Can't be called on nil: something is returning nil
  * Rspec (copy paste) that specific test line
  * What are gems?
    * Smaller program that lives inside Ruby
    * How do I see inside a gem?
      * Can open it from terminal

## Thursday July 9 ##
* TDD
  * Learning objectives:
    * Define unit testing as the process of testing the smallest possible unit of a program
    * Understand each of the three A's of a unit test
    * Write some simple unit tests
  * TDD = Test driven development
  * TDD cycle (red, green, refactor)
    * Write first test
    * Run the code, watch it fail (red)
    * Read the error message
    * Write the code to pass the test
    * Run it again, watch it pass (green)
    * Refactor
      * Making code more concise, cleaning the code up, should NOT change behavior
  * Instance variables: universal within a class, able to be used across methods in a class
    * Instance variable is an attribute of an object (eye color, hair color, etc)
    * State that we're giving an object, methods are behavior of object
  * Unit test steps
    * What do we want to test?
    * Identify nouns (class) and verbs (method)
    * Do input/output table
  * UML = Universal modified language
  * 3 A's:
    * Arrange: set up test
    * Act: behavior/method we're calling
    * Assert: what happens after it takes place

## Friday July 10 ##
* Instance variable: variable that starts with an @ symbol, gives objects their own private space to store data
  * We say objects can 1. Do things 2. Know things
    * Methods make things happen they DO things
    * Instance variables store data, they KNOW things
    * e.g. Fruit class, each attribute becomes instance variable like @color, @type, @weight
  * Define instance variables inside classes
  * Code examples
    * class CoffeeMachine
      * def initialize
        * @water = 100
      * end
      * def make_coffee
        * @water -= 10
      * end
    * end
  * To read instance variable "String #{@variable}"
  * You CANNOT access instance variables from outside the class (encapsulation)
    * You can open a window into the object's data so it's available from outside
      * class CoffeeMachine
        * def initialize
          * @water = 100
        * end
        * def water
          * @water
        * end
      * end
      * machine = CoffeeMachine.new
      * machine.water
      * OR use attr_reader
        * class CoffeeMachine
          * attr_reader :water
          * def initialize
            * @water = 100
          * end
        * end
        * Ruby creates water method by itself
  * Undefined instance variable always returns nil
  * Instance variables don't HAVE to be created in the initialize method, but that's how you give them an initial value
  * Avoid advanced ways to access instance variables (e.g., instance_variable_get)
  * To get list of instance variables
    * machine.instance_variables
