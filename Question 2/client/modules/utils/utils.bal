import 'client.pb as PB;
import ballerina/grpc;
import ballerina/io;

PB:LibraryServiceClient ep = check new ("http://localhost:9090");
# Unary streaming
public function AddBook() 
{
    string isbn = "ISBN 978-2-26-569564-8";
    string title = "Eragon";
    boolean status = true;

    PB:Author[] author_1 = [{firstName: "Christopher", lastName: "Paolini"}];
    PB:Book book = {isbn:isbn, title:title, author: author_1, book_location: {locationID: 0}, status: status};

    PB:RequestBook bookRequest = {requestBook: book};
    do {
        PB:CreateBookList|error result =  ep->AddBook(bookRequest);
        io:print(result);
       
    } on fail error e 
    
    {
        io:println(`Error: ${e}`);
    }
}

# Client-side streaming
public function CreateUsers()
{
    do 
    {
        PB:CreateUsersStreamingClient|grpc:Error CreateUsersStreamingClient = check ep->CreateUsers();
        grpc:Error? error1;
        grpc:Error? error2;

        PB:User[] users =
        [
            {
                userID: "S-70145283",
                firstName: "Franco",
                lastName: "Shikwambi",
                profile: "Student"
            },

            {
                userID: "L-86317509",
                firstName: "Day",
                lastName: "Domingos",
                profile: "Librarian"
            },

            {
                userID: "A-30574621",
                firstName: "Laura",
                lastName: "Conceicao",
                profile: "Admin"
            }
        ];

        PB:RequestUser[] requestUser = [{users: users}];
        if CreateUsersStreamingClient is error { }
        else {
            {
                foreach PB:RequestUser item in requestUser
                {
                    error1 = CreateUsersStreamingClient->sendRequestUser(item);
                }
                error2 = CreateUsersStreamingClient->complete();
            }
        }
    } on fail var e {
    	io:println(e);
    }
}

# Unary streaming
public function update_book() {
    PB:RequestBook request = {requestBook: {isbn: "ISBN 987-3-69-048572-1", title:"Inkspell"}};

    do {
        PB:BookList|grpc:Error? response = check ep->UpdateBook(request);
        io:println(response);

    }on fail var varName {
        io:println(varName);
    }
}


# Server-side streaming
public function remove_book() {
    PB:RemoveRequestBook request = {isbn: "ISBN 978-3-61-528940-7"};
    do {
        stream<PB:BookList, grpc:Error?> result = check ep->RemoveBook(request);
        check result.forEach(function(PB:BookList response){
            io:println(response);
        });
    }on fail var varName {
        io:println(varName);
    }

}

# Server-side streaming
public function list_available_books() {
    PB:RequestListAvailable request = {};
    do {
        stream<PB:BookList, grpc:Error?> result = check ep->ListAvailableBooks(request);
        check result.forEach(function(PB:BookList response){
            io:println(response);
        });
    } on fail var varName {
        io:println(varName);
    }
}

# Unary streaming
public function locate_book() {
    PB:RequestBookLocation request = {isbn: "ISBN 978-4-30-769852-1"};
    do {
        PB:BookList|error result =  ep->BookLocation(request);
        io:print(result);
       
    } on fail error e {
        io:println(`Error: ${e}`);
    }
}

# Unary streaming
public function borrow_book() {
    PB:RequestBookBorrow request = {isbn: "ISBN 978-4-13-586270-9", userID: 111};
    do {
        string|error result =  ep->BorrowBook(request);
        io:print(result);
       
    } on fail error e {
        io:println(`Error: ${e}`);
    }
}


