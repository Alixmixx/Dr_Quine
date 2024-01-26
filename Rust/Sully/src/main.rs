use std::process::Command;
use std::fs::File;
use std::io::Write;

fn main() {
    let i = 5;
    let name = format!("Sully_{}", i);

    if i <= 0 {
        return;
    }

    Command::new("cargo")
    .args(&["new", "--bin", name.as_str()])
    .status()
    .expect("Failed to build the project");

    let data = format!("fn main() {{ println!(\"Meooooow\"); let i = {}; }}", i - 1);
    let mut file = File::create(format!("{}/src/main.rs", name)).expect("Unable to open file");
    file.write_all(data.as_bytes()).expect("Unable to write data");

    Command::new("cargo")
        .current_dir(name)
        .arg("run")
        .status()
        .expect("Failed to run the project");
}
