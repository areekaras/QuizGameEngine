# QuizGameEngine
- Learning TDD from essentialDeveloper.com
- a module responsible for the business logic of the system. Despite the fact that we are building an iOS app, the QuizGameEngine is created as a macOS framework, allowing us to embed it later in any platform specific deployment target (iOS, tvOS, watchOS, macOS). We also get for free blazing fast unit tests 🚀!



## 🍅 01 
Our first component is the Flow, a class responsible for controlling the routing of the system based on a simple question, "Are there any more questions to show?".

- In case there are we want to get the answer for the current question and move on to the next one.
- If there are no more questions we want to route to the results.

As we test drive the Flow we get into how we choose to create classes over structs, abstract behaviours by using protocols, boost your productivity by using a somewhat obscure feature of Xcode and much more!

- https://www.youtube.com/watch?v=NW_KS0o6gMY&list=PLyjgjmI1UzlSUlaQD0RvLwwW-LSlJn-F6&index=2


## 🍅 02 
We continue the development of the Flow as we start progressing to next questions. We accomplish this by providing a closure as the answer callback in the Router protocol. 

We discuss the meaning of placing the @escaping instruction in a protocol and we examine our options for dealing with retain cycles and memory management.

In the test side of things, the RouterSpy is refactored to support multiple questions and it gets an answer callback property, so we can control when a question is being answered from our tests.

- https://www.youtube.com/watch?v=Dr3DL5BeJGA&list=PLyjgjmI1UzlSUlaQD0RvLwwW-LSlJn-F6&index=3


## 🍅 03 
We refactor the tests by removing duplicated code, we talk about different ways for organizing the test setup code and we showcase the factory method for the creation of the system under test. These changes will prove very valuable as the project grows.

In the Flow class, we decided to solve the problem of progressing from one question to the next by using recursion.

Finally, we discussed the access control of the Flow class and we realized that only the start() method needs to be visible to the outside world, meaning the behavior of this class is being tested through this single interface!

- https://www.youtube.com/watch?v=FnzID8Oc1E0&list=PLyjgjmI1UzlSUlaQD0RvLwwW-LSlJn-F6&index=4


## 🍅 04
We finish the Game Flow by creating a solution for accumulating the questions and answers and a new method for routing to the result.

We use the mutation testing technique to check if the behavior of the Flow class is well covered by our tests. We do so by manually mutating the production code and checking if the tests are failing; if they do fail, we're confident with the coverage.

This technique proves its value as it helps us detect a missing test. We add the missing test and discuss how it could have lead to potential bugs in the future.

- https://www.youtube.com/watch?v=BYeOVu7sMxE&list=PLyjgjmI1UzlSUlaQD0RvLwwW-LSlJn-F6&index=5
