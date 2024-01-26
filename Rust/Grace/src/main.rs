use std::fs::File;
use std::io::Write;
const SOURCE_CODE: &str = r##"const SOURCE_CODE: &str = {0:?};

#[macro_export]
macro_rules! write_to_file {
    ($file_name:expr) => {{
        let data = format!("use std::fs::File;
use std::io::Write;
const SOURCE_CODE: &str = r{}#\"{}\"#{};

{}", '#', SOURCE_CODE, '#', &SOURCE_CODE[34..]);
        let mut file = File::create($file_name).expect("Unable to create file");
        file.write_all(data.as_bytes()).expect("Unable to write data");
    }};
}

fn main() {
    write_to_file!("Grace_kid.rs");
}
"##;

#[macro_export]
macro_rules! write_to_file {
    ($file_name:expr) => {{
        let data = format!("use std::fs::File;
use std::io::Write;
const SOURCE_CODE: &str = r{}#\"{}\"#{};

{}", '#', SOURCE_CODE, '#', &SOURCE_CODE[34..]);
        let mut file = File::create($file_name).expect("Unable to create file");
        file.write_all(data.as_bytes()).expect("Unable to write data");
    }};
}

fn main() {
    write_to_file!("Grace_kid.rs");
}
