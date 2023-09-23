import ballerina/grpc;
import 'server.pb as PB;
import 'server.datastore as datastore;

listener grpc:Listener ep = new (9090);

@grpc:Descriptor {value: PB:LIBRARYSYSTEM_DESC}
service "LibraryService" on ep {

remote function AddBook( PB:RequestBook value) returns  PB:CreateBookList|error {
        datastore:books.add(value.requestBook);
        PB:CreateBookList response = {isbn: value.requestBook.isbn};
        return response;

    }
remote function UpdateBook( PB:RequestBook value) returns  PB:BookList|error {
        datastore:books.put(value.requestBook);
        PB:BookList response = {book: datastore:books.get(value.requestBook.isbn)};
        return response;

    }
remote function BookLocation( PB:RequestBookLocation value) returns  PB:BookList|error {
        PB:Book book = datastore:books.get(value.isbn);
        PB:BookList response = {book: book};
        return response;

    }
remote function BorrowBook( PB:RequestBookBorrow value) returns string|error {
        PB:Book book = datastore:books.get(value.isbn);
        
        if book.status == true {
            book.status = false;
            datastore:books.put(book);
            return "Book borrowed successfully!";
        }

        return error("The book you requested is unavailable.");

    }
remote function CreateUsers(stream< PB:RequestUser, grpc:Error?> clientStream) returns string|error {
        _= check clientStream.forEach(function (PB:RequestUser userRequest) {
            foreach PB:User item in userRequest.users {
                datastore:users.add(item);
            }
        });
        return string `User(s) created successfully!`;

    }
remote function RemoveBook( PB:RemoveRequestBook value) returns stream< PB:BookList, error?>|error {
        _ = datastore:books.remove(value.isbn);
        PB:Book[] remaining_books = datastore:books.toArray();
        PB:BookList[] response = [];
        foreach PB:Book item in remaining_books {
            PB:BookList book = {book:item};
            response.push(book);
        }
        
        return response.toStream();

    }
remote function ListAvailableBooks( PB:RequestListAvailable value) returns stream< PB:BookList, error?>|error {
        PB:BookList[] response = [];
        foreach PB:Book item in datastore:books.toArray() {
            if item.status == true{
                PB:BookList book = {book:item};
                response.push(book);
            }
        }

        return response.toStream();

    }
}

