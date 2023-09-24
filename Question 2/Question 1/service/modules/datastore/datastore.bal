import 'service.types as Types;

public table<Types:Lecturer> key(staffNumber) lecturers = table[
    {staffNumber: 2196636265, name: "Ruusa Iipinge", title: "Lecturer", email:"ripinge@nust.na", phoneNumber: "+264 61 207 2001", officeNumber: {officeNumber: 14}, courses: []}
];


public table<Types:Office> key(officeNumber) offices = table[
    {officeNumber: 10, building: "Faculty of Computing & Informatics", floor: 1, room: "C101"},
    {officeNumber: 12, building: "Faculty of Computing & Informatics", floor: 1, room: "C102"},
    {officeNumber: 14, building: "Faculty of Computing & Informatics", floor: 1, room: "C103"}
];


public table<Types:Course> key(courseCode) courses = table[
    {courseCode: "DTA612S", name: "Data Analytics", nqf: 8},
    {courseCode: "SDN611S", name: "Software Design", nqf: 8}
];