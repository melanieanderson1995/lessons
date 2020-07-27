## Monday July 20
* HTTPS
  * HyperText Transfer Protocol
  * Web is built on client-server relationships
  * Client: dependent on the server for providing and managing information, anything that can request a resource from the server
    * Browsers
  * Server: provides information to client
    * Google homepage
  * Parameter: data sent from a client to a server, contain key-value pairs, request can contain multiple parameters
    * One way of sending parameter is to pass in the "query string" (query string is string that can be appended to an URL)
  * http://www.example.com/home?name=Bob&age=21
    * Query string: ?name=Bob&age=21
      * Parameters: name=Bob, age=21
    * Domain name: http://www.example.com
    * Path to the resource: /home
  * GET request: a request that "gets" information
  * Resource is contained in the response "body"
  * Metadata is contained in the response "headers"
  * Can communicate with local server in the same way you would with a remote server
  * View logic should be limited to
    * Light Conditionals (i.e. if and else), and
    * Light Iterators (i.e. each)
  * <%= > evaluates and interpolates whatever comes after the equals sign
  * Sinatra
    * Params (params hash) is provided by Sinatra
      * Collection of all the parameters from the HTTP request
      * One way to pass params to the HTTP request is to use the query string portion of the URL
    * Session is used to keep state during requests
      * If activated you have one session hash per user session
      * enable :sessions
      * get '/' do
        * "value = " << session[:value].inspect
      * end
      * get '/:value' do
        * session['value'] = params['value']
      * end
      * short-term information store that lives on the server
      * very small
      * allows user to store basic pieces of information like name of current user, etc
      * often used to store details of a logged in user
  * Post redirect loop
    * 1. The client gets a page with a form.
    * 2. The form POSTs to the server.
    * 3. The server performs the action, and then redirects to another page.
    * 4. The client follows the redirect.
    * redirect '/route' will issue an 'internal GET request' within the server
  * Elements of a request
    * host: the server to which the request was sent
    * timestamp: when the request was received at the server
    * method: a verb that expresses the intention of the request
    * path: the location within the server where the request will be handled
  * Method = verb that expresses the intention of the request
    * e.g. GET methods = verb that is asking for a server resource, POST methods = asking to modify a server resource
  * POST requests do not store query params in the request string, they store them in the body of the request as "Form Data"
  * Automated browsers are like browsers such as Chrome or Safari, except that they are able to receive instructions programmatically
  * Capybara notes
    * Almost every Capybara feature test involves this process:
      * What does the user have to do?
      * What does the user expect to see?
    * ALWAYS remember to require spec_helper at the top of feature tests
    * Rspec on feature tests will ALWAYS run the first test if there are multiple gets for the same path ("/")
  * Use "helpers" to avoid repetition in feature tests
    * Small objects that provide basic functionality that isn't related to the main aim of a program
    * Used to DRY up code
    * Basically a method you can call in a feature test to replace repetitive stuff (e.g., (enter name 1, enter name 2, click submit) can all be grouped under a helper method sign_in, then in feature tests you just call sign_in)
* NEVER USE A GLOBAL VARIABLE IN A HIRING TECH TEST
## Tuesday July 21
* Process (Request/response) Modeling workshop
  * Learning objectives
    * Define process modelling as a tool to describe and understand a process.
    * Use process modelling to further your understanding of HTTP requests and responses.
  * What is a process?
    * Steps to take to achieve something
    * Something with start and end
    * Something with series of steps or tasks
    * Transition through different phases
    * Executed in a precise order
  * What is a model?
    * Visual representation of what's going on
    * Building blocks of a larger structure
    * Object
    * Simplified version of something
    * Representation that communicates the main elements relevant to the audience
  * Why model a process?
    * It's a quick way to figure out and cement your understanding of how a process works.
    * It's much quicker than writing the code that enacts the process.
    * It's much easier to iterate on a process model than the code that enacts the process.
    * It's much easier to add detail to a process model than to add it to code.
    * It's a great way to communicate and discuss a process with another person.
  * What forms can a process model take?
    * A boxes and arrows diagram.
    * An interpretive dance.
    * A performance where each person is a thing in the process (a server, a GET request).
    * A form of your own invention.
  * diagram.codes for diagramming
* On opening a project in the browser!!!
  * MUST RUN THE RUBY FILE IN THE TERMINAL then do localhost 4567
* Select method
  * Using select requires a block
  * Inside the block you have something that evaluates to true or false, and select uses that to filter the array
## Wednesday July 22
* Capybara
  * describe -> feature
    * feature "name of test" do
  * it -> scenario
    * scenario "what's going on and what will happen" do
## Thursday July 23
* Debugging workshop 2
  * Learning Objectives:
    * Define "debugging" as the process of eliminating bugs
    * Use the mantra TIGHTEN THE LOOP, GET VISIBILITY
    * Use the mantra to resolve bugs across the web stack
  * Ways to get visibility:
    * Stack trace (path to the file that had the error, execution of the program)
    * Use "p" to view outputs at each step
    * Commenting things out - does the program still run?
    * Conditionals & loops: p the statement to make sure you've gotten to a certain line
    * Printing out /1 is this operation, /2 is this operation, getting visibility over what's breaking (identifying pieces of code in the terminal)
    * Read error type
    * Talk to people
    * Rewrite your code if it's too messy
    * Running the code in the web browser
    * Check in Chrome dev tools console for more information about Network
    * Look in the terminal - Shotgun messages
    * Sinatra error messages
  * super() method: when a method with arguments is overridden by one of its child classes (class child < parent), call to super without an argument and child will pass the arguments of the child method to the parent method. If Parent method is not expecting any argument, add () to explicitly indicate to super to not take any argument from the Child#say method
    * class Parent
      * def say(message)
        * p message
      * end
    * end
    * class Child < Parent
      * def say(message)
        * super
      * end
    * end
    * Child.new.say('Hi Rubyist!') # => "Hi Rubyist!"
    * Child class inherits from Parent class
    * Within the Child#say method, we call super without argument
    * Ruby tries to find a method #say in the ancestor chain of the Child class
    * Passes the message argument to the method
  * srand() is another way of mocking random number
