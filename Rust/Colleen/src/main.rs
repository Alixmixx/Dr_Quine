/*
    A
*/
fn main() {
    /*
        B
    */
    quine()
}

fn quine() {
    print!("/*\n    A\n*/\nfn main() {{\n    /*\n        B\n    */\n    quine()\n}}\n\nfn quine() {{\n    print!({0:?}, {0:?})\n}}\n", "/*\n    A\n*/\nfn main() {{\n    /*\n        B\n    */\n    quine()\n}}\n\nfn quine() {{\n    print!({0:?}, {0:?})\n}}\n")
}
