import ballerina/http;
import 'service.types as Types;
import 'service.datastore as Datastore;
import 'service.utils as Utils;

listener http:Listener ep0 = new (9000, config = {host: "localhost"});

service /staffSystemApi/v1 on ep0
{
    resource function get lecturers() returns Types:Lecturer[]|http:Response
    {
        return Datastore:lecturers.toArray();
    }

    resource function post lecturers(@http:Payload Types:Lecturer payload) returns Types:CreatedInlineResponse201|http:Response
    {
        Datastore:lecturers.add(payload);
        Types:CreatedInlineResponse201 response = {body: {staffID: payload.staffNumber}};
        return response;
    }

    resource function get lecturers/[int staffNumber]() returns Types:Lecturer|http:Response
    {
        return Datastore:lecturers.get(staffNumber);
    }

    resource function put lecturers/[int staffNumber](@http:Payload Types:Lecturer payload) returns Types:Lecturer|http:Response
    {
        Datastore:lecturers.put(payload);
        return Datastore:lecturers.get(staffNumber);
    }

    resource function delete lecturers/[int staffNumber]() returns Types:Lecturer|http:Response
    {
        _ = Datastore:lecturers.remove(staffNumber);
        http:Response response = new();
        response.statusCode = 204;
        return response;
    }


    resource function get courses() returns Types:Course[]|http:Response 
    {
        return Datastore:courses.toArray();
    }

    resource function post courses(@http:Payload Types:Course payload) returns Types:CreatedInlineResponse2011|http:Response
    {
        Datastore:courses.add(payload);
        Types:CreatedInlineResponse2011 response = {body: {courseID: payload.courseCode}};
        return response;
    }

    resource function get courses/[string courseCode]() returns Types:Course|http:Response 
    {
        return Datastore:courses.get(courseCode);
    }

    resource function put courses/[string courseCode](@http:Payload Types:Course payload) returns Types:Course|http:Response 
    {
        Datastore:courses.put(payload);
        return Datastore:courses.get(courseCode);
    }

    resource function delete courses/[string courseCode]() returns Types:Course|http:Response 
    {
        _ = Datastore:courses.remove(courseCode);
        http:Response response = new();
        response.statusCode = 204;
        return response;
    }

    resource function get courses/[string courseCode]/lecturers() returns Types:Lecturer[]|http:Response 
    {
        Types:Lecturer[] lecturers = [];
        foreach Types:Lecturer lecturer in Datastore:lecturers.toArray()
        {
            Types:Course[]? courses = lecturer.courses;
            boolean isAssigned = Utils:isAssignedToCourse(courses, courseCode);
            if isAssigned
            {
                lecturers.push(lecturer);
            }
        }

        if lecturers.length() > 0
        {
            return lecturers;
        }

        http:Response response = new();
        response.statusCode = 404;
        return response;
    }

    resource function post courses/[string courseCode]/lecturers(@http:Payload Types:Lecturer payload) returns Types:Lecturer|http:Response 
    {
        Types:Lecturer lecturer = Datastore:lecturers.get(payload.staffNumber);
        Types:Course course = Datastore:courses.get(courseCode);
        Types:Course[] courses = [];
        courses.push(course);
        Types:Course[]? lecturerCourses = lecturer.courses;
        if lecturerCourses == ()
        {
            lecturer.courses = courses;
        }
        else {
            Types:Course[] temporaryCourses = lecturerCourses;
            temporaryCourses.push(course);
            lecturerCourses = temporaryCourses;
        }

        return Datastore:lecturers.get(payload.staffNumber);
    }


    resource function get offices() returns Types:Office[]|http:Response 
    {
        return Datastore:offices.toArray();
    }

    resource function post offices(@http:Payload Types:Office payload) returns Types:CreatedInlineResponse2012|http:Response 
    {
        Datastore:offices.add(payload);
        Types:CreatedInlineResponse2012 response = {body: {officeID: payload.officeNumber}};
        return response;
    }

    resource function get office/[int officeNumber]() returns Types:Office|http:Response 
    {
        return Datastore:offices.get(officeNumber);
    }

    resource function put offices/[int officeNumber](@http:Payload Types:Office payload) returns Types:Office|http:Response 
    {
        Datastore:offices.put(payload);
        return Datastore:offices.get(officeNumber);
    }

    resource function delete offices/[int officeNumber]() returns Types:Office|http:Response 
    {
        _ = Datastore:offices.remove(officeNumber);
        http:Response response = new();
        response.statusCode = 204;
        return response;
    }

    resource function get offices/[int officeNumber]/lecturers() returns Types:Lecturer[]|http:Response 
    {
        Types:Lecturer[] lecturers = [];
        foreach Types:Lecturer lecturer in Datastore:lecturers.toArray() 
        {
            boolean isInOffice = Utils:isInOffice(lecturer.officeNumber, officeNumber);
            if isInOffice
            {
                lecturers.push(lecturer);
            }
        }

        if lecturers.length() > 0
        {
            return lecturers;
        }

        http:Response response = new();
        response.statusCode = 404;
        return response;
    }
}