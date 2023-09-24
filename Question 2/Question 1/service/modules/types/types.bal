import ballerina/http;

public type CreatedInlineResponse201 record {|
    *http:Created;
    InlineResponse201 body;
|};

public type CreatedInlineResponse2012 record {|
    *http:Created;
    InlineResponse2011 body;
|};

public type CreatedInlineResponse2011 record {|
    *http:Created;
    InlineResponse2012 body;
|};

public type Office record {
    # Office Number
    readonly int officeNumber;

    # Office Building
    string building?;

    # Office Floor
    int floor?;

    # Office Room Number
    string room?;
};

public type InlineResponse201 record 
{
    # Staff number of newly added lecturer
    int staffID?;
};

public type InlineResponse2012 record 
{
    # Office number of newly added lecturer
    int officeID?;
};

public type InlineResponse2011 record
{
    int courseID?;
};

public type Error record {
    # Type of error
    string errorType?;

    # Actual error message
    string message?;
};


public type Lecturer record
{
    # Lecturer staff number
    readonly int staffNumber;

    # Lecturer's name
    string name?;

    # Lecturer's title
    string title?;

    # Lecturer's email address
    string email?;

    #Lecturer's phone number
    string phoneNumber?;

    #Lecturer's office number
    Office officeNumber?;

    # Courses taught by a lecturer
    Course[] courses?;
};

public type Course record 
{
    # The course code
    readonly string courseCode;

    # Course name
    string name?;

    # Course NQF Level
    anydata nqf?;
};