## Monday 3 Aug
* Javascript
  * DON'T FORGET SEMI COLONS
  * Access javascript REPL through Chrome Devtools Console
  * class ClassName {
      * function(argument) {
        * code block;
      * }
    * }
## Tuesday 4 Aug
* Flow of control and getting visibility in JS
  * Similar to tightening the loop, but instead of trying to narrow in on one line of code you're just trying to understand what happens when a piece of code runs
  * Techniques
    * console.log();
      * Log little strings you recognize to figure out what is running and in which order
      * console.log(this);
        * could return HTML Window
      * console.log(variable); to see if it contains what I expect
        * console.log(airport);
          * returns Airport {weather: sunny}
      * console.log(class.function); is right function being called
        * console.log(airport.land)
          * returns whole function (if else ifs etc)
      * console.log(class.function()); is function returning what is expected
        * console.log(airport.land());
          * can't read isLanded because no plane is passed in as parameter
      * console.log(parameter) within class; does the parameter contain what is expected
        * class Airport {
          * land(plane) {
            * console.log(plane);
          * }
        * }
    * Using step debugger
      * Program that runs your program and lets you step through line by line
        * function sayHi() {
          * var x = "hi";
          * debugger;
          * x = "howdy";
          * console.log(x);
        * }
        * sayHi();
* JavaScript
  * Fixed values are called literals
    * Numbers are written with or without decimals
    * Strings are text written within double or single quotes
  * Variable values are called variable; declared with var
      * Declare variables
      * most recent var is used if multiple vars are assigned
      * assigned by = sign (e.g. x = 5)
      * let
        * throws error if 2 lets are assigned
      * const
        * throws error if you try to change
  * Operators used to compute values
    * + - * / %
    * = is an assignment operator
  * Expression is a combo of values, variables, and operators which compute to a value
  * Comments are put after // or between /* and * /
  * JavaScript is case sensitive, no hyphens, and use lowerCamelCase
    * e.g. lastName and lastname are 2 different variables
  * You can write JS without ; if you put each expression on a separate line
  * function declaration:
    * function functionName(parameters) {
      * code to be executed
    * }
  * To make new array/array functions
    * var myArray = [];
    * myArray.push("hi");
    * arrays of arrays
      * dogs = {rover: {color: "brown" size: "large"},
        * spot: {color: "black", size: "small"}};
      * dogs["spot"]["size"]; results in "small"
      * dogs.rover.color; results in "brown"
  * Date
    * new Date(); creates a new Date instance representing current time and date
    * new Date(2010, 2, 1); creates new Date representing 2010-Mar-01 00:00:00
    * new Date(2010, 2, 1, 14, 25, 30); creates new Date represention 2010-Mar-01 14:25:30
  * Error
    * throw new Error("Error message");
  * Math
    * .abs = absolute value
    * .ceil = round up to smallest integer
    * .floor = round down to largest integer
    * .max(1, -2) = maximum from pair
    * .min(1, -2) = minimum from pair
    * .random() = pseudorandom number between 0 inclusive and 1 exclusive (.1786 etc)
    * .round(1.5) = round to the nearest integer, half fractions are rounded up
  * Common methods
    * spread operator: lists elements in array without loop function
      * console.log(...favoriteFood); returns Pizza Fries etc
    * includes(): searches for string in collection returns true or false CASE SENSITIVE
    * some(): checks if some elements exist in an array and returns true or false, argument is a FUNCTION not a STRING
      * const age = [16, 14, 18]
      * age.some((person) => person >= 18); returns true
  * To invoke strict mode put 'use strict'; at the top of each file
  * constructor() creates template for class objects (e.g. (first, last, age, eyes) with this.firstName = first; this.lastName = last; etc) ALSO REFERRED TO AS PROPERTIES
    * this refers to class it's situated in (e.g. thermostat)
    * Creates properties of the Thermostat, then you add functions to access those properties
    * To return properties you need a GETTER method (e.g. isPowerSavingModeOn())
  * To identify that we want to return a boolean value, put is at the front of the method name instead of ? at the end(e.g. isMinimumTemperature vs minimum_temperature?)
  * = to set new state (e.g. on or off) use === to compare (is true?)
* JQuery
  * REMEMBER! #ids, .classes
  * src attribute(above other script still in body) in the script element must point to a copy of jQuery
  * "$(document).ready(function() { })" translate to "only execute function when document is ready"
  * Selector: "$('element')" where element is a CSS selector or tag name
  * Event listeners: "$('element').on('event', function() { })" where "event" is an action you are listening for on the page (clicks, scrolls, typing, etc)
  * Callbacks: "$('#some-heading').click(function() { })" callback is the function passed to the click function, that executes at some point in the future. i.e., when there is a click on the element with the ID "some-heading", run the function"
  * Common methods
    * $('#id').text('text') adds some text to that specified id (e.g. if you specified h1's id as 'temperature', then '#temperature' would be affected by .text)
      * 'text' can also be a method such as (as long as you called a new instance of Thermostat first and assigned it) thermostat.temperature
    * .attr() get the value of an attribute for the first element in the set of matched elements
      * "$('#temperature').attr('class', thermostat.energyUsage());
      }" where #temperature is the id, the attr we're adding is a 'class', and what determines it is the output from thermostat.energyUsage()
  * Flow of user interaction: user input -> event listener -> update model -> update view to reflect change in model
