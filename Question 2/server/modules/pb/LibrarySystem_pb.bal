import ballerina/grpc;
import ballerina/protobuf;
import ballerina/protobuf.types.wrappers;

public const string LIBRARYSYSTEM_DESC = "0A134C69627261727953797374656D2E70726F746F1A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F2299010A04426F6F6B12120A046973626E18012001280952046973626E12140A057469746C6518022001280952057469746C65121F0A06617574686F7218032003280B32072E417574686F725206617574686F72122E0A0D626F6F6B5F6C6F636174696F6E18042001280B32092E4C6F636174696F6E520C626F6F6B4C6F636174696F6E12160A067374617475731805200128085206737461747573225E0A06417574686F72121A0A08617574686F7249441801200128055208617574686F724944121C0A0966697273744E616D65180220012809520966697273744E616D65121A0A086C6173744E616D6518032001280952086C6173744E616D652280010A084C6F636174696F6E121E0A0A6C6F636174696F6E4944180120012805520A6C6F636174696F6E494412140A05666C6F6F721802200128055205666C6F6F7212120A0461696C65180320012809520461696C6512180A077368656C66494418042001280952077368656C66494412100A03726F771805200128055203726F7722360A0B52657175657374426F6F6B12270A0B72657175657374426F6F6B18012001280B32052E426F6F6B520B72657175657374426F6F6B22240A0E437265617465426F6F6B4C69737412120A046973626E18012001280952046973626E22270A1152656D6F766552657175657374426F6F6B12120A046973626E18012001280952046973626E22160A14526571756573744C697374417661696C61626C65223C0A1352657175657374426F6F6B4C6F636174696F6E12250A086C6F636174696F6E18012001280B32092E4C6F636174696F6E52086C6F636174696F6E223F0A1152657175657374426F6F6B426F72726F7712120A046973626E18012001280952046973626E12160A06757365724944180220012805520675736572494422720A045573657212160A067573657249441801200128095206757365724944121C0A0966697273744E616D65180220012809520966697273744E616D65121A0A086C6173744E616D6518032001280952086C6173744E616D6512180A0770726F66696C65180420012809520770726F66696C65222A0A0B5265717565737455736572121B0A05757365727318012003280B32052E557365725205757365727322250A08426F6F6B4C69737412190A04626F6F6B18012001280B32052E426F6F6B5204626F6F6B32F8020A0E4C6962726172795365727669636512280A07416464426F6F6B120C2E52657175657374426F6F6B1A0F2E437265617465426F6F6B4C697374123B0A0B4372656174655573657273120C2E52657175657374557365721A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565280112250A0A557064617465426F6F6B120C2E52657175657374426F6F6B1A092E426F6F6B4C697374122D0A0A52656D6F7665426F6F6B12122E52656D6F766552657175657374426F6F6B1A092E426F6F6B4C697374300112380A124C697374417661696C61626C65426F6F6B7312152E526571756573744C697374417661696C61626C651A092E426F6F6B4C6973743001122F0A0C426F6F6B4C6F636174696F6E12142E52657175657374426F6F6B4C6F636174696F6E1A092E426F6F6B4C697374123E0A0A426F72726F77426F6F6B12122E52657175657374426F6F6B426F72726F771A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565620670726F746F33";

public isolated client class LibraryServiceClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, LIBRARYSYSTEM_DESC);
    }

    isolated remote function AddBook(RequestBook|ContextRequestBook req) returns CreateBookList|grpc:Error {
        map<string|string[]> headers = {};
        RequestBook message;
        if req is ContextRequestBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryService/AddBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <CreateBookList>result;
    }

    isolated remote function AddBookContext(RequestBook|ContextRequestBook req) returns ContextCreateBookList|grpc:Error {
        map<string|string[]> headers = {};
        RequestBook message;
        if req is ContextRequestBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryService/AddBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <CreateBookList>result, headers: respHeaders};
    }

    isolated remote function UpdateBook(RequestBook|ContextRequestBook req) returns BookList|grpc:Error {
        map<string|string[]> headers = {};
        RequestBook message;
        if req is ContextRequestBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryService/UpdateBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BookList>result;
    }

    isolated remote function UpdateBookContext(RequestBook|ContextRequestBook req) returns ContextBookList|grpc:Error {
        map<string|string[]> headers = {};
        RequestBook message;
        if req is ContextRequestBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryService/UpdateBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BookList>result, headers: respHeaders};
    }

    isolated remote function BookLocation(RequestBookLocation|ContextRequestBookLocation req) returns BookList|grpc:Error {
        map<string|string[]> headers = {};
        RequestBookLocation message;
        if req is ContextRequestBookLocation {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryService/BookLocation", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <BookList>result;
    }

    isolated remote function BookLocationContext(RequestBookLocation|ContextRequestBookLocation req) returns ContextBookList|grpc:Error {
        map<string|string[]> headers = {};
        RequestBookLocation message;
        if req is ContextRequestBookLocation {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryService/BookLocation", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <BookList>result, headers: respHeaders};
    }

    isolated remote function BorrowBook(RequestBookBorrow|ContextRequestBookBorrow req) returns string|grpc:Error {
        map<string|string[]> headers = {};
        RequestBookBorrow message;
        if req is ContextRequestBookBorrow {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryService/BorrowBook", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }

    isolated remote function BorrowBookContext(RequestBookBorrow|ContextRequestBookBorrow req) returns wrappers:ContextString|grpc:Error {
        map<string|string[]> headers = {};
        RequestBookBorrow message;
        if req is ContextRequestBookBorrow {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("LibraryService/BorrowBook", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }

    isolated remote function CreateUsers() returns CreateUsersStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("LibraryService/CreateUsers");
        return new CreateUsersStreamingClient(sClient);
    }

    isolated remote function RemoveBook(RemoveRequestBook|ContextRemoveRequestBook req) returns stream<BookList, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        RemoveRequestBook message;
        if req is ContextRemoveRequestBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("LibraryService/RemoveBook", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        BookListStream outputStream = new BookListStream(result);
        return new stream<BookList, grpc:Error?>(outputStream);
    }

    isolated remote function RemoveBookContext(RemoveRequestBook|ContextRemoveRequestBook req) returns ContextBookListStream|grpc:Error {
        map<string|string[]> headers = {};
        RemoveRequestBook message;
        if req is ContextRemoveRequestBook {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("LibraryService/RemoveBook", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        BookListStream outputStream = new BookListStream(result);
        return {content: new stream<BookList, grpc:Error?>(outputStream), headers: respHeaders};
    }

    isolated remote function ListAvailableBooks(RequestListAvailable|ContextRequestListAvailable req) returns stream<BookList, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        RequestListAvailable message;
        if req is ContextRequestListAvailable {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("LibraryService/ListAvailableBooks", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        BookListStream outputStream = new BookListStream(result);
        return new stream<BookList, grpc:Error?>(outputStream);
    }

    isolated remote function ListAvailableBooksContext(RequestListAvailable|ContextRequestListAvailable req) returns ContextBookListStream|grpc:Error {
        map<string|string[]> headers = {};
        RequestListAvailable message;
        if req is ContextRequestListAvailable {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("LibraryService/ListAvailableBooks", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        BookListStream outputStream = new BookListStream(result);
        return {content: new stream<BookList, grpc:Error?>(outputStream), headers: respHeaders};
    }
}

public client class CreateUsersStreamingClient {
    private grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendRequestUser(RequestUser message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextRequestUser(ContextRequestUser message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveString() returns string|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return payload.toString();
        }
    }

    isolated remote function receiveContextString() returns wrappers:ContextString|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: payload.toString(), headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public class BookListStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|BookList value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if (streamValue is ()) {
            return streamValue;
        } else if (streamValue is grpc:Error) {
            return streamValue;
        } else {
            record {|BookList value;|} nextRecord = {value: <BookList>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
    }
}

public client class LibraryServiceBookListCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendBookList(BookList response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextBookList(ContextBookList response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryServiceCreateBookListCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendCreateBookList(CreateBookList response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextCreateBookList(ContextCreateBookList response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class LibraryServiceStringCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendString(string response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextString(wrappers:ContextString response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextBookListStream record {|
    stream<BookList, error?> content;
    map<string|string[]> headers;
|};

public type ContextRequestUserStream record {|
    stream<RequestUser, error?> content;
    map<string|string[]> headers;
|};

public type ContextRemoveRequestBook record {|
    RemoveRequestBook content;
    map<string|string[]> headers;
|};

public type ContextRequestListAvailable record {|
    RequestListAvailable content;
    map<string|string[]> headers;
|};

public type ContextBookList record {|
    BookList content;
    map<string|string[]> headers;
|};

public type ContextRequestBook record {|
    RequestBook content;
    map<string|string[]> headers;
|};

public type ContextRequestBookLocation record {|
    RequestBookLocation content;
    map<string|string[]> headers;
|};

public type ContextRequestBookBorrow record {|
    RequestBookBorrow content;
    map<string|string[]> headers;
|};

public type ContextRequestUser record {|
    RequestUser content;
    map<string|string[]> headers;
|};

public type ContextCreateBookList record {|
    CreateBookList content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: LIBRARYSYSTEM_DESC}
public type RemoveRequestBook record {|
    string isbn;
|};

@protobuf:Descriptor {value: LIBRARYSYSTEM_DESC}
public type RequestListAvailable record {|
|};

@protobuf:Descriptor {value: LIBRARYSYSTEM_DESC}
public type User record {|
    readonly string userID;
    string firstName ;
    string lastName ;
    string profile;
|};

@protobuf:Descriptor {value: LIBRARYSYSTEM_DESC}
public type BookList record {|
    Book book;
|};

@protobuf:Descriptor {value: LIBRARYSYSTEM_DESC}
public type Book record {|
    readonly string isbn;
    string title;
    Author[] author;
    Location book_location;
    boolean status = false;
|};

@protobuf:Descriptor {value: LIBRARYSYSTEM_DESC}
public type RequestBook record {|
    Book requestBook;
|};

@protobuf:Descriptor {value: LIBRARYSYSTEM_DESC}
public type RequestBookLocation record {|
    string isbn;
|};

@protobuf:Descriptor {value: LIBRARYSYSTEM_DESC}
public type Author record {|
    readonly int authorID;
    string firstName;
    string lastName;
|};

@protobuf:Descriptor {value: LIBRARYSYSTEM_DESC}
public type RequestBookBorrow record {|
    string isbn;
    string userID;
|};

@protobuf:Descriptor {value: LIBRARYSYSTEM_DESC}
public type RequestUser record {|
    User[] users;
|};

@protobuf:Descriptor {value: LIBRARYSYSTEM_DESC}
public type Location record {|
    readonly int locationID;
    int floor;
    string aisle;
    string shelfID;
    int row;
|};

@protobuf:Descriptor {value: LIBRARYSYSTEM_DESC}
public type CreateBookList record {|
    string isbn;
|};

