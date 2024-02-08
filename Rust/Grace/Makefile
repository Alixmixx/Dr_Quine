all:
	cargo build --release

run:
	cargo run --release

diff:
	cargo run --release
	diff src/main.rs Grace_kid.rs

clean:
	cargo clean
	rm -f Grace_kid.rs

.PHONY: all clean