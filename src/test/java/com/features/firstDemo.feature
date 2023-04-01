Feature: First Demo

  Scenario: How to print
    Given print "Hello World"
    When print "Hello hello"
    Then print "happy halloween"


  Scenario: more printing
    Given print "some more candy for halloween"
    * print "more candy"
    * print 2+2


  Scenario: defining variables
    * def name = 'Sue'
    * print 'my name is ' + name
    * def zipcode = 15217
    * print 'my zip is ' + zipcode


  Scenario: defining different parameters: JSON object
        # JSON object defining
    * def employee = { 'name' : 'Sue', 'job' : 'IT' }
    * print employee
    * print employee.name
    * print employee.job


  Scenario: defining different parameters: JSON object - 2
    * def employee2 =
      """
      {
      "firstName":"Sue",
      "lastName":"Kim",
      "job":"IT"
      }
      """
    * print employee2.firstName
    * print employee2.job


  Scenario: spartan object
    * def spartan =
        """
        {
      "id": 9,
      "name": "Florrie",
      "gender": "Female",
      "phone": 1702025787
        }
        """
    * print spartan.id
    * print spartan.name
    * print spartan.phone

    @wip
    Scenario: How to reach array objects
      * def spartans =
      """
      [
        {
            "id": 39,
            "name": "Eveleen",
            "gender": "Female",
            "phone": 1362642898
        },
        {
            "id": 465,
            "name": "Lavern",
            "gender": "Female",
            "phone": 12533732417
        },
        {
            "id": 587,
            "name": "Everett",
            "gender": "Female",
            "phone": 9029908717
        }
      ]
      """
      * print spartans[1].name
      * print spartans[2].phone




