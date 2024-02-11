use std::ffi::{c_char, CStr};

#[repr(C)]
pub struct Person {
    pub name: *const c_char,
}

#[no_mangle]
pub extern "C" fn create_person(name: *const c_char) -> Person {
    Person { name }
}

#[no_mangle]
pub extern "C" fn print_person(person: Person) {
    let c_str = unsafe { CStr::from_ptr(person.name) };
    println!("Hello, Sailor {}", c_str.to_str().unwrap());
}
