import 'service.types as Types;

// A function to check whether a lecturer has been assigned a course
public function isAssignedToCourse(Types:Course[]? courses, string courseCode) returns boolean
{
    if courses != () 
    {
        foreach Types:Course course in courses 
        {
            if course.courseCode == courseCode
            {
                return true;
            }   
        }
    }

    return false;
}


public function isInOffice(Types:Office? office, int officeNumber) returns boolean
{
    if office is Types:Office
    {
        if office.officeNumber == officeNumber
        {
            return true;
        }
    }

    return false;
}