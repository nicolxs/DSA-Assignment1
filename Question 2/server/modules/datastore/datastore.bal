import 'server.pb as PB;

public table<PB:Author> key(authorID) authors = table[
    {authorID: 101, firstName: "Karin", lastName: "Slaughter"},
    {authorID: 102, firstName: "Sabaa", lastName: "Tabir"},
    {authorID: 103, firstName: "Skye", lastName: "Warren"},
    {authorID: 104, firstName: "Cornelia", lastName: "Funke"},
    {authorID: 105, firstName: "Michael", lastName: "Robotham"},
    {authorID: 106, firstName: "Erika L", lastName: "James"},
    {authorID: 107, firstName: "Dorothy", lastName: "Koomson"}
    
];

public table<PB:Book> key(isbn) books = table[
    {isbn: "ISBN 978-2-08-413765-9",title: "Fractured", author: [{authorID: 101, firstName: "Karin", lastName: "Slaughter"}], book_location: {locationID: 204, floor: 4, aisle: "Murder Mysteries", shelfID: "M004", row: 2}, status: false},
    {isbn: "ISBN 978-4-13-586270-9",title: "An Ember In The Ashes", author: [{authorID: 102, firstName: "Sabaa", lastName: "Tahir"}], book_location: {locationID: 201, floor: 1, aisle: "Fantasy", shelfID: "F001", row: 6}, status: true},
    {isbn: "ISBN 978-8-54-723960-1",title: "The Pawn", author: [{authorID: 103, firstName: "Skye", lastName: "Warren"}], book_location: {locationID: 203, floor: 3, aisle: "Erotic Literature", shelfID: "L003", row: 7}, status: true},
    {isbn: "ISBN 978-3-69-048572-1",title: "Inkspell", author: [{authorID: 104, firstName: "Cornelia", lastName: "Funke"}], book_location: {locationID: 201, floor: 1, aisle: "Fantasy", shelfID: "F001", row: 28}, status: false},
    {isbn: "ISBN 978-1-76-530294-8",title: "The Secrets She Keeps", author: [{authorID: 105, firstName: "Michael", lastName: "Robotham"}], book_location: {locationID: 202, floor: 2, aisle: "Thriller", shelfID: "T002", row: 2}, status: false},
    {isbn: "ISBN 978-4-30-769852-1",title: "Darker", author: [{authorID: 106, firstName: "Erika L", lastName: "James"}], book_location: {locationID: 203, floor: 3, aisle: "Erotic Literature", shelfID: "L003", row: 2}, status: false},
    {isbn: "ISBN 978-3-61-528940-7",title: "The Rose Petal Beach", author: [{authorID: 107, firstName: "Dorothy", lastName: "Koomson"}], book_location: {locationID: 201, floor: 1, aisle: "Thriller", shelfID: "T002", row: 1}, status: true}
];

public table<PB:Location> key(locationID) locations = table[
    {locationID: 201, floor: 1, aisle: "Fantasy", shelfID: "F001", row: 2},
    {locationID: 202, floor: 2, aisle: "Thriller", shelfID: "T002", row: 3},
    {locationID: 203, floor: 3, aisle: "Erotic Literature", shelfID: "E003", row: 4},
    {locationID: 204, floor: 4, aisle: "Murder Mysteries", shelfID: "M004", row: 5}
];
 

public table<PB:User> key(userID) users = table[
    {userID: "S-70145283", firstName: "Sakaria", lastName: "Nghivafe", profile: "Student"},
    {userID: "S-59038724", firstName: "Franco", lastName: "Shikwambi", profile: "Student"},
    {userID: "L-86317509", firstName: "Day", lastName: "Domingos", profile: "Librarian"},
    {userID: "L-90217853", firstName: "Faith", lastName: "Mulife", profile: "Librarian"},
    {userID: "A-30574621", firstName: "Laura", lastName: "Conceicao", profile: "Admin"},
    {userID: "A-83524076", firstName: "Penipawa", lastName: "Hailonga", profile: "Admin"}
];
