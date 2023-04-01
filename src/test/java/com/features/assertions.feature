Feature: Assertions

  Scenario: some matching examples
    * def name = "Sue Kim"
    * match name == "Sue Kim"
    # similar to Assert.assertEquals(name, "Sue Kim")


  Scenario: more matching examples
    * def spartan =
      """
      {
    "id": 9,
    "name": "Florrie",
    "gender": "Female",
    "phone": 1702025787,
    "active": true
       }
      """
    * def spartan_name = spartan.name
    * print spartan_name
    * match spartan_name == 'Florrie'
    * match spartan.gender == 'Female'
    * match spartan.phone == 1702025787

  
  Scenario: Fuzzy matching (kinds of JSON SCHEMA VALIDATION)
    * def spartan =
      """
      {
    "id": 9,
    "name": "Florrie",
    "gender": "Female",
    "phone": 1702025787,
    "active": true
       }
      """
    * match spartan.id == '#number'
    * match spartan.name == '#string'
    * match spartan.phone == '#present'
    * match spartan.lastName == '#notpresent'
    * match spartan.active == "#boolean"


  Scenario: contains method
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
    * def length = spartans.length
    * match length == 3
    * match spartans contains {"id": 587, "name": "Everett", "gender": "Female", "phone": 9029908717 }
    # contains any
    * def items = { item : [1,2,3] }
    * match items.item contains any [9,2,8]
    # contains each
    * def data = { foo: [{ bar: 1, baz: 'a' }, { bar: 2, baz: 'b' }, { bar: 3 , baz: 'c' }]}
    * match each data.foo == { bar: '#number', baz: '#string' }
