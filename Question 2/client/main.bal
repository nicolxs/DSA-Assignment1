import ballerina/io;
import 'client.pb as PB;
import 'client.utils as Utils;

PB:LibraryServiceClient ep = check new ("http://localhost:9090");

public function main() {
    io:println("Select an option from the list \n1) Add Book \n2) Create Users \n3) Update Book \n4) Remove Book \n5) List Available Books \n6) Locate Book \n7) Borrow Book");
    string choice = io:readln();

    if choice == "1" {
        Utils:AddBook();
    }
    if choice == "2" {
        Utils:CreateUsers();
    }
    if choice == "3" {
        Utils:update_book();
    }
    if choice == "4" {
        Utils:remove_book();
    }
    if choice == "5" {
        Utils:list_available_books();
    }
    if choice == "6" {
        Utils:locate_book();
    }
    if choice == "7" {
        Utils:borrow_book();
    }
}
