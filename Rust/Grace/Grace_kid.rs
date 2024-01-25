use std::fs::File;
use std::io::Write;

mod macros {
    #[macro_export]
    macro_rules! write_to_file {
        () => {
            let data = format!(
                "use std::fs::File;\nuse std::io::Write;\n\nmod macros {{\n    #[macro_export]\n    macro_rules! write_to_file {{\n        () => {{\n            let data = format!(\n                \"{}\",\n            );\n            let mut file = File::create(\"Grace_kid.rs\").expect(\"Unable to create file\");\n            file.write_all(data.as_bytes()).expect(\"Unable to write data\");\n        }};\n    }}\n}}\n\nfn main() {{\n    write_to_file!();\n}}\n",
            );
            let mut file = File::create("Grace_kid.rs").expect("Unable to create file");
            file.write_all(data.as_bytes()).expect("Unable to write data");
        };
    }
}

fn main() {
    write_to_file!();
}
