use std::process::Command;
use std::fs::File;
use std::io::Write;

const SOURCE_CODE: &str = r##"use std::process::Command;
use std::fs::File;
use std::io::Write;

const SOURCE_CODE: &str = r#""#;

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

    let data = format!("use std::process::Command;
    use std::fs::File;
    use std::io::Write;
    
    const SOURCE_CODE: &str = r{}#\"{}\"#{};

{}", '#', SOURCE_CODE, '#', &SOURCE_CODE[101..]);
    let mut file = File::create(format!("../{}/src/main.rs", name)).expect("Unable to open file");
    file.write_all(data.as_bytes()).expect("Unable to write data");

    Command::new("cargo")
        .current_dir("../".to_string() + &name)
        .arg("run")
        .status()
        .expect("Failed to run the project");
}
"##;

fn main() {
    let i = 5;
    let name = format!("Sully_{}", i);

    if i <= 0 {
        return;
    }

    Command::new("cargo")
    .current_dir("../")
    .args(&["new", "--bin", name.as_str()])
    .status()
    .expect("Failed to build the project");

    let data = format!("use std::process::Command;
    use std::fs::File;
    use std::io::Write;
    
    const SOURCE_CODE: &str = r{}#\"{}\"#{};

{}", '#', SOURCE_CODE, '#', &SOURCE_CODE[101..]);
    let mut file = File::create(format!("../{}/src/main.rs", name)).expect("Unable to open file");
    file.write_all(data.as_bytes()).expect("Unable to write data");

    Command::new("cargo")
        .current_dir("../".to_string() + &name)
        .arg("run")
        .status()
        .expect("Failed to run the project");
}
