use std::process::Command;

fn main() {
    Command::new("cargo")
        .args(&["new", "--bin", "Sully1"])
        .status()
        .expect("Failed to build the project");

    Command::new("cargo")
        .current_dir("Sully1")
        .arg("run")
        .status()
        .expect("Failed to run the project");
}
