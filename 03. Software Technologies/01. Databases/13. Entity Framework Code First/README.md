## Entity Framework Code First
1.  Using c0de first approach, create database for student system with the following tables:
  * `Students`
    * fields: Id, Name, Number, etc.
  * `Courses`
    * fields: Name, Description, Materials, etc.
  * `StudentsInCourses`
    * many-to-many relationship
  * `Homework`
    * one-to-many relationship with students and courses
    * fields: Content, TimeSent
  * Annotate the data models with the appropriate attributes and enable code first migrations
1.  Write a console application that uses the data
1.  Seed the data with random values
