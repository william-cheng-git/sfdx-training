1. This session is for you if, you experience these
   1. Cascading test failure (i.e. one changes failing multiple test classes)
   2. Creating lengthly code to prepare all prerequisite for a test
   3. Creating the same prerequisite for test repeatedly
2. Objective to create unit test
   1. Test all boundary conditions
   2. Fast, parallel execution
   3. Eliminate external dependencies and hence avoid cascading failure

3. Things to avoid
   1. Database access
      1. Test become slow whenever there are SOQL / DML
      2. When there are DML, it may also run trigger, flow, workflow, etc... hence it is not longer a unit test
   2. Static method
      1. Use static method wrapper
   3. Tightly copuling
      1. Directly firing DML / Query
         1. Use DAO instead
      2. Direct Object instantiation
         1. Use dependency injection
4. Mocking
   1. Library : https://github.com/salesforce/apex-mockery
   2. OOTB : https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_testing_stub_api.htm
