# Notes Week 1 #
## Monday July 13 ##
* Code review
  * User stories:
    * As an air traffic controller, so I can get passengers to a destination, I want to instruct a plane to land at an airport
    * As an air traffic controller, to ensure safety, I want to prevent landing when the airport is full
    * As the system designer, so that the software can be used for many different airports, I would like a default airport capacity that can be overridden as appropriate
  * Incomplete stories:
    * README
      * Approach
      * Functional Representation Diagram
    * As an air traffic controller, so I can get passengers on the way to their destination, I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    * As an air traffic controller, to ensure safety, I want to prevent takeoff when weather is stormy
    * As an air traffic controller, to ensure safety, I want to prevent landing when weather is stormy
  * Notes from Ryan:
    * Run Rubocop, be aware of spacing
    * Methods are simply
    * Try to remove more @s
    * Make fail messages more descriptive
    * Fix weather method
      * Can't call include on integer, maybe make it an array?
      * Refactor so it's on one line
    * Good tests
      * Simple, easily readable
  * Don't do massive pull requests, do little chunks
  * Do more frequent commits
* Gemfile
  * Gem vs Gemfile
  * To start Gemfile use "bundle init"
    * "bundle update"
  * RVM: Ruby Version Manager
    * "ruby -v"
    * "rvm install (newest version)"
  * Gemfile contains version information (what version of Ruby are we using) and gems necessary and their versions (e.g. rspec, etc)
  * What does the group :development and :test do?
* Process workshop
  * Once a week, Monday afternoons
  * Work on developer process
  * Pair off with someone and share screen and record for 25 minutes, then switch
  * Possible feedback
    * Observation guidance:
      * https://github.com/makersacademy/skills-workshops/blob/master/process_review/observation_guidance.md
  * Hilda notes
    * Check for typos! (desrcibe v describe)
    * Always run irb first to feature test
    * Maybe try breaking it into MORE tests (years divisible by 400, years divisible by 4 and not 100, etc)
    * Remember booleans and tricks for method naming (e.g. leapyear? instead of leapyear to remind yourself it's a boolean value you're looking for)
    * Watch spacing and indentation to make the code more readable for others
    * Remember naming conventions (e.g. Leap_Year vs Leap_year vs Leapyear)
    * Good job reading errors
    * Watch where you're naming things (where you put the leapy array)
    * Try using p instead of puts (gives more accurate read out I can explain why)
    * To make answers clearer try using interpolation
    * Try individual examples in feature testing rather than writing a whole block of code (test if year % 400 == 0 is "is a leap year" before writing other conditions maybe?)
    * Be careful what are arguments and what are conditions (using 400 (vs year) as divisible(argument) vs as an if condition is tripping you up I think, just make your tests a little clearer and rely more on variables)
    * Check ORDER of methods (years.each.to_i vs years.to_i.each)
    * Pay attention to string vs integer (your values in your array ARE integers, not strings)
    * Double check your test! If you unit test isn't correct then you won't be able to figure out the code
  * My notes
    * SLOW DOWN, TAKE YOUR TIME
    * Go line by line
    * Read the error messages more, check the LINE more
    * Good job on retesting
    * Refactor more
## Tuesday July 14
* Domain Model Diagramming
  * What is a diagram?
    * Pictoral or graphical representation of information
  * Why is a diagram useful
    * Organization
    * Easy to change
    * High level overview
  * Learning objectives:
    * Describe a domain model as the nouns and verbs in a program and the relationships between them
    * Explain how you use domain model diagramming as a part of your process
    * Use domain model diagramming to help with coding
  * Domain: the environment, the area within which everything exists
  * User story:
    * 1 WHO
    * 2 WHY
    * 3 WHAT
  * UML = Unified modeling language
    * Class diagram
      * Class name
        * e.g. coin
      * Instance variables (nouns)
        * e.g. @head_count
      * Methods (verbs)
        * e.g. flip
    * Sequence diagram
    * Domain model diagram
      * Object -> method -> object
        * e.g. HeadCount -> flip -> coin
* Self method
  *
## Wednesday July 15
* SICK DAY
## Thursday July 16
* Delegation
  * Learning objectives
    * Describe delegation as the delegation of a responsibility to another class
    * Explain what is meant by "delegate, delegate, delegate"
    * Implement OOP delegation
  * Two ways for classes to work together
    * Inheritance: create class hierachies
      * Parent class shares methods, constants, and instance variable definitions with any class that inherits from it
    * Composition: class creates objects from another class then uses these objects to delegate work to them
      * E.g. computer is made from many parts (objects) and each part knows how to do one thing well. If you want to render something on screen the computer will tell the graphics card what to show, but not how to do it
      * If you're the computer and you want to give access to the graphics card methods you have to build some kind of "bridge" between them
  * Ruby method delegation example
    * Two classes: computer, memory
    * class Computer
      * def initialize
        * @memory = Memory.new
      * end

      * def write(data)
        * @memory.write(data)
      * end

      * def read(index)
        * @memory.read(index)
      * end
    * end
    * class Memory
      * def initialize
        * @data = []
      * end

      * def write(data)
        * @data << data
      * end

      * def read(index)
        * @data[index]
      * end
    * end
      * computer = Computer.new
    * Reasons to only access memory through the Computer
      * Only 1 memory unit, means you only want 1 memory object. By centralizing access in 1 object, you can achieve that
      * You want to control who can access the memroy (different applications) and what parts of memory they can use
      * You want to log every memory access for security or debugging
    *  We are passing along the requests to the @memory object
    * Writing dependencies
      * Create first class Ceo, create second class Coo
      * Create instance of coo = Coo.new
      * call Coo method on instance of coo (coo.find_company_savings)
        * TOO COUPLED
      * INSTEAD create initialize in Ceo
    * look at delegation_practice.rb
* Dependency injection
  * Gluing components together at runtime
  * Gives loose coupling between components
  * Makes code more testable
  *
* Doubles, mocks, stubs
  * Double:
    * name = double("name")
    * expect(name).to receive(:method).with(argument)
  * Stub: control the value so that every time the method is called it returns the same value
    * allow(generator).to receive(:rand).and_return(5) for random number generator
    * A method stub is an instruction to an object (real or test double) to return a. known value in response to a message
* Double bang (!!) = @var != nil ? true : false
* SOLID
  * SRP
  * Dependency Inversion Principle
    * High-level modules that provide complex logic, should not be affected by low-level modules, which provide utility features
    * Must introduce abstration that decouples the high-level and low-level modules
## Friday July 17
* Testing state rather than behavior
  * If you test for state rather than behavior (e.g. adding an attr_reader) class exposes its implementation and your tests are relying on it
    * If you wanted to refactor class, extract a class from it, or change how it stores its state, you then have to CHANGE your tests
  * How do I test behavior?
    * Test methods, not instance variables
    * Use getters/setters rather than working on instance variables
    * Ensure you encapsulate state within the class
    * FOLLOW this process:
      * 1: Who or what is the user of this code? It might be the end user (a real person) or it might be another class
      * 2: What job is this code doing for that user?
      * e.g. Who is the user of this code? The user of my Diary class is a person who is keeping their diary. What job is this code doing? They add an entry so they can read it later.
        * The second answer is the BEHAVIOR of the Diary class
        * Instead of calling .entries(which is an instance variable) call method .print_entries(which is a method that returns the entries, so if we change entries to journals etc then it won't break the test)
