// #[repr(C)]
// pub struct Person {
//     pub name: i32,
// }

#[no_mangle]
pub extern "C" fn print_person() {
    println!("Hello, Sailor");
}
