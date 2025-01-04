# Unhandled Exception in Asynchronous Dart Network Request

This repository demonstrates a common error in Dart when working with asynchronous network requests. The provided code attempts to fetch data from a remote API.  The original code lacks robust error handling, which can lead to unexpected crashes or application instability. The solution provides better error handling and more informative error messages.

## Bug

The initial `fetchData()` function only prints a generic error message, making debugging difficult.   More specific error handling is necessary. 

## Solution

The improved version provides better error handling, including more context and checking for specific HTTP status codes. It also provides a custom exception class to improve debugging.

## How to run the code:

1. Clone this repository
2. Run `dart bug.dart` to see the original, less robust error handling
3. Run `dart bugSolution.dart` to see the improved error handling
